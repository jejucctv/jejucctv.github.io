import React, { useEffect, useState } from 'react';
import ReactPlayer from 'react-player';
import styled, { keyframes } from 'styled-components';
import { PlayerProvider } from '../contexts/Player';
import './CctvPlayer.css';

const Container = styled.div`
  /* border-radius: 5px; */
  position: relative;
  box-sizing: border-box;
  border: 1px white;
`;

const StateContainer = styled.div`
  position: absolute;
  bottom: 0;
  right: 0;
  justify-items: center;
`;

const animate = keyframes`
  50% {
    opacity: 0;
  }
`;

const StateRound = styled.span`
  background-color: ${(props) => (props.isPlay ? 'mediumseagreen' : 'tomato')};
  border-radius: 45%;
  width: 8pt;
  height: 8pt;
  margin-right: 3px;
  display: inline-block;
  animation: ${animate} 1.2s step-end infinite;
`;

const Title = styled.span`
  color: white;
  font-size: 15px;
  display: inline-block;
`;

const getPlayerHeight = (w) => {
  return Math.round((w / 16) * 9);
};

const CctvPlayer = ({ name, url }) => {
  const [playerSize, setPlayerSize] = useState({
    width: (document.body.clientWidth - 60) / 4,
    height: getPlayerHeight((document.body.clientWidth - 60) / 4),
  });
  const [isPlay, setIsPlay] = useState(false);
  const [playState, setPlayState] = useState(true);
  const [isControl, setIsControl] = useState(false);
  // const playColor = 'mediumseagreen';
  // const stopColor = 'tomado';

  useEffect(() => {
    const doRefresh = () => {
      const w = (document.body.clientWidth - 20) / 4;
      setPlayerSize({ width: w, height: getPlayerHeight(w) });
    };

    window.addEventListener('resize', doRefresh);
    return () => {
      window.removeEventListener('resize', doRefresh);
    };
  }, [playerSize]);

  const onPlayerBuffered = () => {
    console.log('buffered', name);
    setIsPlay(true);
  };

  const onPlayerError = (e) => {
    console.log('error', name, e);
    setIsPlay(false);
  };

  const onPause = () => {
    console.log('onPause');
    if (isControl) {
      setPlayState(true);
    }
  };

  return (
    <PlayerProvider>
      <Container
        onDoubleClick={() => {
          // setIsPlay(!isPlay);
        }}
        onClick={() => {
          // setIsControl(!isControl);
        }}
      >
        <StateContainer>
          <StateRound isPlay={isPlay} />
          <Title>{name}</Title>
        </StateContainer>
        <ReactPlayer
          url={url}
          playing={true}
          muted={true}
          // controls={isControl}
          width={playerSize.width}
          height={playerSize.height}
          onPause={onPause}
          onError={onPlayerError}
          onBufferEnd={onPlayerBuffered}
          // onReady={onPlayerReady}
          // onStart={onPlayerStart}
        />
      </Container>
    </PlayerProvider>
  );
};

export default CctvPlayer;
