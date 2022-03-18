import React, { useState } from "react";
import Cookies from "js-cookie";
import {toast} from "react-toastify";

export const LikeButtonComponent = ({likes_number, is_liked, artist_id}) => {
  const [like, setLike] = useState(likes_number | 0),
      [isLike, setIsLike] = useState(is_liked | false),
      [artistID] = useState(artist_id),

    onLikeButtonClick = async () => {
        await fetch('http://localhost:8000/api/artists/' + artistID + '/like/',
            {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': Cookies.get('csrftoken'),
                },
                credentials: 'include'
            }
        ).then(res => {
            if (res.status === 200) {
                setLike(like + (isLike ? -1 : 1));
                setIsLike(!isLike);
            } else {
                toast.error(res.statusText);
            }
         });
    };

  return (
    <>
      <button
        className={"like-button " + (isLike ? "liked" : "")}
        onClick={onLikeButtonClick}
      >
        {isLike ? "Liked" : "Like"} | {like}
      </button>
      <style>{`
        .like-button {
            font-size: 1rem;
            padding: 5px 10px;
            color:  #585858;
        }
        .liked {
            font-weight: bold;
            color: #1565c0;
        }
      `}</style>
    </>
  );
};
