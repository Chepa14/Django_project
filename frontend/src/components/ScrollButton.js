import React, {useState} from 'react';
import { Bullet } from './Styles';

const ScrollButton = () =>{

  const [visible, setVisible] = useState(false)

  const toggleVisible = () => {
    const scrolled = document.documentElement.scrollTop;
    if (scrolled > 900){
      setVisible(true)
    }
    else if (scrolled <= 900){
      setVisible(false)
    }
  };

  const scrollToTop = () =>{
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  };

  window.addEventListener('scroll', toggleVisible);

  return (
      <Bullet>
          <img id='bullet' src="/images/bullet_transparent.png" alt="Move page to the up" onClick={scrollToTop}
            style={{display: visible ? 'inline' : 'none'}}/>
      </Bullet>
  );
}

export default ScrollButton;
