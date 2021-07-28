import React from 'react';
import styled from 'styled-components';

const Container = styled.div`
  min-height: 7vh;
  background-color: black;
  border-top: 2px solid lightgray;
  display: flex;
  align-items: center;
  justify-content: center;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
`;

const Text = styled.div`
  color: gray;
  font-size: 9pt;
`;

const Link = styled.a`
  :visited {
    color: gray;
  }
  :link {
    color: gray;
  }
  :active {
    color: gray;
  }
`;

const Footer = () => {
  const github = 'https://github.com/sh0seo';
  return (
    <Container>
      <Text>
        made by <Link href={github}>https://github.com/sh0seo</Link> | mail{' '}
        <Link href="mailto:ssh0702@gmail.com">ssh0702@gmail.com</Link>
      </Text>
    </Container>
  );
};

export default Footer;
