import React from 'react';
import './App.css';
import CctvPlayer from './component/CctvPlayer';
import Footer from './component/Footer';
import styled from 'styled-components';
import CctvUrls from './Constants';
import MainCctvPlayer from './component/MainCctvPlayer';
import PlayerContext from './contexts/Player';

const Header = styled.div`
  /* min-height: 10vh; */
  background-color: #61dafb;
`;

const Content = styled.div`
  background-color: #282c34;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: calc(10px + 2vmin);
  color: white;
  padding-left: 30px;
  padding-right: 30px;
`;

const App = () => {
  const getPlayers = (urls, start) => {
    let content = [];
    for (let i = start; i < 4 + start; i++) {
      content.push(
        <td key={i}>
          <CctvPlayer name={urls[i].name} url={urls[i].url} />
        </td>
      );
    }
    return content;
  };

  return (
    <div>
      <Header></Header>
      <Content>
        <table>
          <tbody>
            <tr>{getPlayers(CctvUrls, 0)}</tr>
            <tr>{getPlayers(CctvUrls, 4)}</tr>
            <tr>{getPlayers(CctvUrls, 8)}</tr>
            <tr>{getPlayers(CctvUrls, 12)}</tr>
          </tbody>
        </table>
        {/* <MainCctvPlayer /> */}
      </Content>
      <Footer />
    </div>
  );
};

export default App;
