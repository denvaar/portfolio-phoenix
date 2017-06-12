import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

import MarkdownEditor from 'cute-md-editor';

const uploadCallback = (files) => {
  let data = new FormData();
  data.append('images', files[0]);
  return axios.post("/api/image/upload", data);
}

const removeCallback = (path) => {
  const data = {
    params: {
      path: path
    }
  };

  return axios.delete("/api/image/remove", data);
}


ReactDOM.render(
  <MarkdownEditor
    uploadCallback={uploadCallback}
    removeCallback={removeCallback}
    elementId="post_content"
    elementName="post[content]"
    content={content} />,
  document.getElementById('react-root')
);
