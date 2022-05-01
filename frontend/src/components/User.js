import React, {useEffect, useRef, useState} from "react";
import {getCurrentUser, updateUser, updateUserImage} from "../requests/requests";
import {local_frontend_url} from "../requests/constants";

const User = () => {
    const [user, setUser] = useState({});
    const [loading, setLoading] = useState(true);
    const [first_name, setFirstname] = useState('');
    const [last_name, setLastname] = useState('');
    const [about, setAbout] = useState('');
    const [avatar] = useState(null);
    const inputFile = useRef(null)

    useEffect(() => {
        const token = localStorage.getItem('token')
        if (token == null) {
          window.location.replace(`${local_frontend_url}/login`);
        } else {
            const fetchData = async () => {
                const data = await getCurrentUser(token)
                setUser(data);
                setFirstname(data.first_name);
                setLastname(data.last_name);
                setAbout(data.about_me);
                setLoading(false);
            }
            fetchData().catch(console.error)
        }
    }, []);

    const onSubmit = async e => {
        e.preventDefault();

        if(first_name || last_name || about) {
            const user = {
              first_name: first_name,
              last_name: last_name,
              about_me: about
            };

            setUser(await updateUser(user, localStorage.getItem('token')))
            setLoading(false);
        }

        if (avatar) {
            const formData = new FormData();
            formData.append('avatar', avatar);

            setUser(await updateUserImage(formData, localStorage.getItem('token')))
            setLoading(false);
        }
    };

    const callUploadFie = () => {
        inputFile.current.click();
    }

    const uploadFile = async (event) => {
        const formData = new FormData();
        formData.append('avatar', event.target.files[0]);

        setUser(await updateUserImage(formData, localStorage.getItem('token')))
    }

    return(
        <div className="Lastestnews" style={{paddingTop: " 20px"}}>
            <div className="news-box container">
                {loading === false && (
                <div className="row" style={{}}>
                    <div className="col">
                        <div className="address">
                            <form>
                                <div style={{margin: "auto", paddingTop: "40px", paddingLeft: "40px", paddingBottom: "20px"}}>
                                    <img width="400" height="400" src={ user.avatar || "/images/default_user_img.png"}
                                         alt="" onClick={callUploadFie} style={{border: "2px solid lightgrey", borderRadius: "5px"}}/>
                                    <input type="file" accept="image/*"
                                               ref={inputFile} style={{display: 'none'}} onChange={uploadFile}/>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div className="col">
                        <div className="address" style={{paddingTop: "40px"}}>
                            <form onSubmit={onSubmit}>
                                <div>
                                    <p style={{padding: "0px"}}>Username:</p>
                                    <h2> {user.username} </h2>
                                </div>
                                <div>
                                    <p style={{padding: "0px"}}>Email:</p>
                                    <h2> {user.email} </h2>
                                </div>
                                <div>
                                    <p style={{padding: "0px 0px 10px 0px"}}>First Name:</p>
                                    <input type="text"
                                           placeholder='-'
                                           defaultValue={first_name}
                                           className="profile_input"
                                           onChange={e => setFirstname(e.target.value)}/>
                                </div>
                                <div>
                                    <p style={{padding: "10px 0px 10px 0px"}}>Last Name:</p>
                                    <input
                                           type="text"
                                           placeholder='-'
                                           defaultValue={last_name}
                                           className="profile_input"
                                           onChange={e => setLastname(e.target.value)}/>
                                </div>
                                <div>
                                    <p style={{padding: "10px 0px 10px 0px"}}>About me:</p>
                                    <textarea className="textarea"
                                              placeholder="A couple of words..."
                                              defaultValue={about}
                                              onChange={e => setAbout(e.target.value)}/>
                                </div>
                                <div style={{display: "flex", justifyContent: "center"}}>
                                    <input type='submit' value='Save' className="send" style={{backgroundColor: "black"}}/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>)}
            </div>
        </div>
    );
}

export default User;
