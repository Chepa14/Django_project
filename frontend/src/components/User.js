import React, {useEffect, useState} from "react";
import {getCurrentUser, updateUser, updateUserImage} from "../requests/requests";

const User = () => {
    const [user, setUser] = useState({});
    const [loading, setLoading] = useState(true);
    const [first_name, setFirstname] = useState(null);
    const [last_name, setLastname] = useState(null);
    const [about, setAbout] = useState(null);
    const [avatar, setAvatar] = useState(null);

    useEffect(() => {
        const token = localStorage.getItem('token')
        if (token == null) {
          window.location.replace('http://localhost:3000/login');
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

    const uploadFile = (event)=>{
        const reader = new FileReader();
        reader.onload = function(){
            window.location.href = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
        setAvatar(event.target.files[0]);
    }

    return(
        <div className="container">
            {loading === false && (
            <div className="row">
                <div className="col">
                    <div className="address">
                        <form>
                            <div className="row">
                                <div style={{margin: "auto"}}>
                                    <img width="400" height="400" src={ user.avatar || "/images/default_user_img.png"}
                                         alt=""/>
                                    {!user.avatar &&
                                        <input type="file" onChange={uploadFile}/>
                                    }
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div className="col">
                    <div className="address">
                        <form onSubmit={onSubmit}>
                            <div className="row">
                                <div className="col-sm-12">
                                    <p>Username:</p>
                                    <h2> {user.username} </h2>
                                </div>
                                <div className="col-sm-12">
                                    <p>Email:</p>
                                    <h2> {user.email} </h2>
                                </div>
                                <div className="col-sm-12">
                                    <p>First Name:</p>
                                    <input type="text"
                                           placeholder='  -'
                                           defaultValue={first_name}
                                           className="profile_input"
                                           onChange={e => setFirstname(e.target.value)}/>
                                </div>
                                <div className="col-sm-12">
                                    <p>Last Name:</p>
                                    <input type="text"
                                           placeholder='  -'
                                           defaultValue={last_name}
                                           className="profile_input"
                                           onChange={e => setLastname(e.target.value)}/>
                                </div>
                                <div className="col-sm-12">
                                    <p>About me:</p>
                                    <textarea className="textarea"
                                              placeholder="A couple of words..."
                                              defaultValue={about}
                                              onChange={e => setAbout(e.target.value)}/>
                                </div>
                                <div className="col-sm-12 offset-4">
                                    <input type='submit' value='Save'/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>)}
        </div>
    );
}

export default User;
