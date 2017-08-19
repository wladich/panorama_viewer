<html>
<head>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        .content {
            display: flex;
            flex-direction: row;
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
        }
        .files-pane {
            width: 250px;
            overflow: auto;
        }
        .pano-pane {
            flex-grow: 1;
            margin: 0;
            padding: 0;
        }
        .file-item {
            display: block;
        }
        .file-item input {
            display: none;
        }
        .file-item :checked + span {
            background-color: #aaccff;
        }

    </style>
</head>
<body>
<div class="content">
    <div class="files-pane">
        % for f in files:
            <label class="file-item">
                <input class="file-item-button" type="radio" name="fileItem" value="{{ f }}" />
                <span>{{ f }}</span>
            </label>
        % end
    </div>
    <iframe class="pano-pane" id="pano" allowfullscreen></iframe>
</div>
<script type="text/javascript">
    function onFileClicked(e) {
        var filename = e.target.value;
        document.getElementById('pano').src = "pannellum.htm?autoLoad=true&panorama=panos/" + filename;
    }

    var buttons = document.getElementsByClassName("file-item-button");
    for (var i=0; i < buttons.length; i++) {
        buttons[i].addEventListener('change', onFileClicked);
    }
    if (buttons.length) {
        buttons[0].click();
    }
</script>
</body>
</html>