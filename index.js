import React, { Component, PropTypes } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableWithoutFeedback,
  NativeModules,
  findNodeHandle
} from 'react-native';
import PreviewView from './PreviewView';

const Peekable = {};

const PREVIEW_REF = 'peekable-preview';

Peekable.Preview = PreviewView;

Peekable.View = React.createClass({
  propTypes: {
    renderPreview: PropTypes.func,
    onPop: PropTypes.func,
    ...View.propTypes,
  },

  render() {
    let preview = (
      <Peekable.Preview ref={PREVIEW_REF} onPop={this.props.onPop}>
        {this.props.renderPreview()}
      </Peekable.Preview>
    );

    return (
      <TouchableWithoutFeedback onPressIn={this._handlePressIn}>
        <View {...this.props} ref={(view) => { this._root = view; }}>
          {this.props.children}
          {preview}
        </View>
      </TouchableWithoutFeedback>
    )
  },

  _handlePressIn() {
    this.refs[PREVIEW_REF].activate({
      sourceView: findNodeHandle(this._root)
    });
  },
});

module.exports = Peekable;
