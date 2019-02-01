//Iframe高度自适应
function IFrameResize(id) {

	var pTar = null;
	if (document.getElementById) {
		pTar = document.getElementById(id);
	} else {
		eval('pTar = ' + down + ';');
	}
	if (pTar && !window.opera) {
		// begin resizing iframe
		pTar.style.display = "block"
		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
			// ns6 syntax
			pTar.height = pTar.contentDocument.body.offsetHeight + 20;
		} else if (pTar.Document && pTar.Document.body.scrollHeight) {
			// ie5+ syntax
			pTar.height = pTar.Document.body.scrollHeight;
		}
	}

}