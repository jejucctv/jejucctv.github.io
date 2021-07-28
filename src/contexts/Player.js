import { createContext, useState } from 'react';

const PlayerContext = createContext({
  state: {
    name: '서귀포항',
    url: 'http://59.8.86.15:1935/live/52.stream/playlist.m3u8',
    isPlaying: false,
  },
  actions: {
    setName: () => {},
    setUrl: () => {},
    setIsPlaying: () => {},
  },
});

const PlayerProvider = ({ children }) => {
  const [name, setName] = useState('');
  const [url, setUrl] = useState('');
  const [isPlaying, setIsPlaying] = useState('');

  const value = {
    state: { name, url, isPlaying },
    actions: { setName, setUrl, setIsPlaying },
  };
  return (
    <PlayerContext.Provider value={value}>{children}</PlayerContext.Provider>
  );
};

const { Consumer: PlayerConsumer } = PlayerContext;

export { PlayerProvider, PlayerConsumer };

export default PlayerContext;
