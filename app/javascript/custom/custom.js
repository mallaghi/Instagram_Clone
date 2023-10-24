import * as FilePond from "filepond";
// Import the plugin code
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';

import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';

document.addEventListener("turbo:load", loadFilePond);

function loadFilePond() {
  FilePond.registerPlugin(
    FilePondPluginImagePreview,
    FilePondPluginFileValidateType
  );
  const inputElement = document.querySelector("#post-images");
  const inputElement2 = document.querySelector("#story-image");
  const pond = FilePond.create(inputElement, {
    credits: {},
    storeAsFile: true,
    allowMultiple: true,
    allowReorder: true,
    acceptedFileTypes: ['image/*'],
  });
  const pond2 = FilePond.create(inputElement2, {
    credits: {},
    storeAsFile: true,
    allowMultiple: true,
    allowReorder: true,
    acceptedFileTypes: ['image'],
  });
}
