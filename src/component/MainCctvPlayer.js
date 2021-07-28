import React, { useContext } from 'react';
import styled, { keyframes } from 'styled-components';
import ReactPlayer from 'react-player';
import PlayerContext from '../contexts/Player';

const fadeIn = keyframes`
    0% { opacity: 0; }
    100% { opacity: 1; }
`;
const Main = styled.div`
  border: 1px lightgray solid;
  width: 640px;
  height: 360px;
  position: absolute;
  animation: ${fadeIn} 1s forwards;
  background-color: #282c34;
  display: ${(props) => (props.playing ? 'block' : 'none')};
`;

const MainCctvPlayer = () => {
  const playerContext = useContext(PlayerContext);
  return (
    <Main playing={playerContext.isPlaying}>
      <ReactPlayer
        width="640"
        height="360"
        url={playerContext.url}
        playing={true}
        muted={true}
        onBufferEnd={() => {
          console.log(playerContext.name);
        }}
      />
    </Main>
  );
};

export default MainCctvPlayer;
