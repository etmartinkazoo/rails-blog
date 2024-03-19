import EditorJS from '@editorjs/editorjs'; 

class CustomBlock {
  static get toolbox() {
    return {
      icon: '<svg>...</svg>', // Icon for your custom block
      title: 'Custom Block' // Title displayed in the toolbox
    };
  }

  constructor({ data, config, api }) {
    this.data = {
      heading: data.heading || '',
      subheading: data.subheading || '',
      button1: {
        text: data.button1 ? data.button1.text : 'Button 1',
        link: data.button1 ? data.button1.link : '',
      },
      button2: {
        text: data.button2 ? data.button2.text : 'Button 2',
        link: data.button2 ? data.button2.link : '',
      }
    };
    this.api = api;
    this.settings = {
      defaultText: 'Button Text',
      defaultLink: 'https://example.com',
      backgroundImage: '/img.jpeg' // URL of background image
    };
  }

  render() {
    const wrapper = document.createElement('div');
    wrapper.style.padding = '50px'
    wrapper.classList.add('custom-block');
    
    const heading = document.createElement('h2');
    heading.setAttribute('contenteditable', true)
    heading.setAttribute('placeholder', 'Enter heading')
    heading.classList.add('editable_div')
    heading.innerHTML = this.data.heading;
    heading.style.color = 'white';

    heading.addEventListener('input', (event) => {
      this.data.heading = event.target.innerHTML;
    });

    const subheading = document.createElement('p');
    subheading.setAttribute('contenteditable', true)
    subheading.setAttribute('placeholder', 'Enter subheading')
    subheading.classList.add('editable_div');
    subheading.style.color = 'white';

    subheading.addEventListener('input', (event) => {
      this.data.subheading = event.target.innerHTML;
    });

    const button1 = document.createElement('button');
    button1.classList.add('btn-green');
    const button1Link = document.createElement('a');
    button1Link.innerHTML = this.data.button1.text;
    button1Link.setAttribute('href', this.data.button1.link);
    button1.addEventListener('click', (event) => {
      event.preventDefault();
    })
    button1.appendChild(button1Link);

    const mainData = this.data;
    const links_wrapper = document.createElement('div');
    const btn1Text = document.createElement('input');
    btn1Text.setAttribute('placeholder', 'Change Button 1 Text here...');
    btn1Text.addEventListener('keyup', function(event) {
      mainData.button1.text = event.target.value;
      button1Link.innerHTML = event.target.value;
    })
    links_wrapper.appendChild(btn1Text);
    const btn1Link = document.createElement('input');
    btn1Link.setAttribute('placeholder', 'Change Button 1 Link here...');
    btn1Link.addEventListener('keyup', function(event) {
      mainData.button1.link = event.target.value;
      button1Link.setAttribute('href', event.target.value);
    })
    links_wrapper.appendChild(btn1Link);

    links_wrapper.appendChild(document.createElement('br'));

    const button2 = document.createElement('button');
    button2.classList.add('btn-green');
    const button2Link = document.createElement('a');
    button2Link.innerHTML = this.data.button2.text;
    button2Link.setAttribute('href', this.data.button2.link);
    button2.addEventListener('click', function(event) {
      event.preventDefault();
    })
    button2.appendChild(button2Link);

    const btn2Text = document.createElement('input');
    btn2Text.setAttribute('placeholder', 'Change Button 2 Text here...');
    btn2Text.addEventListener('keyup', function(event) {
      mainData.button2.text = event.target.value;
      button2Link.innerHTML = event.target.value;
    })
    links_wrapper.appendChild(btn2Text);
    const btn2Link = document.createElement('input');
    btn2Link.setAttribute('placeholder', 'Change Button 2 Link here...');
    btn2Link.addEventListener('keyup', function(event) {
      mainData.button2.link = event.target.value;
      button2Link.setAttribute('href', event.target.value);
    })
    links_wrapper.appendChild(btn2Link);
    // button2.setAttribute('data-link', this.settings.defaultLink);

    // Set background image
    wrapper.style.backgroundImage = `url(${this.settings.backgroundImage})`;
    wrapper.style.backgroundRepeat = 'no-repeat';
    wrapper.style.backgroundSize = 'cover';

    // Append elements to wrapper
    wrapper.appendChild(heading);
    wrapper.appendChild(subheading);
    wrapper.appendChild(button1);
    wrapper.appendChild(button2);
    wrapper.appendChild(document.createElement('br'));
    wrapper.appendChild(links_wrapper);
    

    return wrapper;
  }

  save() {
    // Logic to save data when block is saved
    // Save the data
    console.log("Data = ", this.data);
    return this.data;
  }
}

// Register the custom block with Editor.js
// EditorJS.blockManager.registerBlock('custom-block', CustomBlock);

export default CustomBlock;