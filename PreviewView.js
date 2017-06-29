import React,{ Component, PropTypes } from 'react';
import {
  View,
  StyleSheet,
  NativeModules,
  findNodeHandle,
  requireNativeComponent,
} from 'react-native';

const { RNPreviewViewManager } = NativeModules;
const RN_PREVIEW_VIEW_REF = 'native-preview-view-ref';

class PreviewView extends Component {
  activate({ sourceView }) {
    RNPreviewViewManager.setSourceView(sourceView);
    RNPreviewViewManager.activate(this.getRootNodeHandle());
  }

  getRootNodeHandle() {
    return findNodeHandle(this.refs[RN_PREVIEW_VIEW_REF]);
  }

  render() {
    return (
      <RNPreviewView ref={RN_PREVIEW_VIEW_REF} onPop={this.props.onPop} style={{ position: 'absolute' }}>
        {this.props.children}
      </RNPreviewView>
    );
  }
}

PreviewView.propTypes = {
  onPop: PropTypes.func,
};

const RNPreviewView = requireNativeComponent('RNPreviewView', PreviewView);

export default PreviewView;
