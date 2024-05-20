<!DOCTYPE html>
<html>
<head>
    <title>EasyUI Data Grid</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-easyui@1.5.21/js/jquery.easyui.min.js"></script>

</head>
<body>
<h2>EasyUI Data Grid</h2>
<table id="dg" title="My Data Grid" style="width:600px;height:250px"></table>

<script type="text/javascript">
    fetch('/persons/test')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log('Data:', data);
        })
        .catch(error => {
            console.error('Error:', error);
        });

    $(function(){
        $('#dg').datagrid({
            url: '/persons/test',
            columns: [[
                {field: 'id', title: 'Id', width: 100},
                {field: 'name', title: 'Name', width: 100},
                {field: 'surname', title: 'Surname', width: 100, align: 'right'}
            ]]
        });
    });

</script>
</body>
</html>
