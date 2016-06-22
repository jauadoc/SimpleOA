<html>
<body>
	<img id="image" src="" />
	<br />
	<input type="file" onchange="selectImage(this);" />
	<br />
	<input type="button" onclick="uploadImage();" value="�ύ" />
	<script>
		var image = '';
		function selectImage(file) {
			if (!file.files || !file.files[0]) {
				return;
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				document.getElementById('image').src = evt.target.result;
				image = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		}
		function uploadImage() {

			$.ajax({

				type : 'POST',

				url : 'ajax/uploadimage',

				data : {
					image : image
				},

				async : false,

				dataType : 'json',

				success : function(data) {

					if (data.success) {

						alert('�ϴ��ɹ�');

					} else {

						alert('�ϴ�ʧ��');

					}

				},

				error : function(err) {

					alert('�������');

				}

			});

		}
	</script>
	<script src="jquery-1.11.1.min.js"></script>
</body>
</html>