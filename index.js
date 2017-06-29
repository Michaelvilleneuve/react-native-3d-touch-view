import React, { Component } from 'react';
inport {
  View,
  PropTypes,
  StyleSheet,
  NativeModules,
  requireNativeComponent,
} from 'react-native';

const { RNPreviewViewManager } = NativeModules;
const RN_PREVIEW_VIEW_REF = 'native-preview-view-ref';

class PreviewView extends component {
  propTypes: {
    onPop: PropTypes.func,
  },

  activate({ sourceView }) {
    RNPreviewViewManager.setSourceView(sourceView);
    RNPreviewViewManager.activate(this.getRootNodeHandle());
  },

  getRootNodeHandle() {
    return React.findNodeHandle(this.refs[RN_PREVIEW_VIEW_REF]);
  },

  render() {
    return (
      <RNPreviewView ref={RN_PREVIEW_VIEW_REF} onPop={this.props.onPop} style={{ position: 'absolute' }}>
        {React.Children.map(this.props.children, React.addons.cloneWithProps)}
      </RNPreviewView>
    );
  },
}

const RNPreviewView = requireNativeComponent('RNPreviewView', PreviewView);

export default PreviewView;
