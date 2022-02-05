import styled from 'styled-components';

export const Heading = styled.h1`
   text-align: center;
   color: green;
`;

export const Content = styled.div`
   overflowY: scroll;
   height: 2500px;
`;

export const Button = styled.div`
   position: fixed; 
   width: 100%;
   left: 50%;
   bottom: 40px;
   height: 20px;
   font-size: 3rem;
   z-index: 1;
   cursor: pointer;
   color: green`;

export const Bullet = styled.div`
   position: fixed;
   width: 40px;
   height: 10px;
   left: 95%;
   bottom: 180px;
   z-index: 1;
   cursor: pointer`;
