import { Controller } from "@hotwired/stimulus"
import EditorJS from '@editorjs/editorjs'; 

import CodeTool from '@editorjs/code';
import Header from '@editorjs/header'; 
import List from '@editorjs/list'; 
import Paragraph from '@editorjs/paragraph'; 

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ['content', 'hidden_content']
  connect() {
    const savedContent = this.savedContent();
    this.contentEditor = new EditorJS({ 
      /** 
       * Id of Element that should contain the Editor 
       */ 
      holder: this.contentTarget,
      data: savedContent,
      tools: {
        header: {
          class: Header,
        },
        list: {
          class: List,
        },
        paragraph: {
          class: Paragraph,
          inlineToolbar: true,
        },
        code: CodeTool
      }
    });

    this.element.addEventListener('submit', this.saveEditorData.bind(this));
  }

  savedContent() {
    if(this.hidden_contentTarget.value) {
      return JSON.parse(this.hidden_contentTarget.value);
    }
    return {};
  }

  async saveEditorData(event) {
    event.preventDefault();

    const outputData = await this.contentEditor.save();

    const articleForm = this.element;
    const hiddenInput = document.getElementById('posts_content_hidden');
    hiddenInput.value = JSON.stringify(outputData);
    articleForm.submit();
  }
}
