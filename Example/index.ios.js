/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Image,
  View
} from 'react-native';
import Peekable from 'react-native-3d-touch-view';

export default class Example extends Component {
  _renderPreviewOne() {
    return (
      <Image source={{uri: 'https://facebook.github.io/react/img/logo_og.png'}} style={{width: 400, height: 400}} />
    )
  }

  _handlePopOne() {
   alert('pop first one!');
 }

  render() {
    return (
      <View style={styles.container}>
        <Peekable.View
          renderPreview={this._renderPreviewOne}
          onPop={this._handlePopOne}>
          <Text>Tap me to peek!</Text>
        </Peekable.View>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('Example', () => Example);
