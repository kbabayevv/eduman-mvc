<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>EasyUI Data Grid</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-easyui@1.5.21/js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/jquery-easyui@1.5.21/themes/default/easyui.css">
</head>
<body>
<h2>EasyUI Data Grid</h2>
<table id="dg" title="My Data Grid" style="width:600px;height:250px"></table>

<script type="text/javascript">
    $(document).ready(function () {
        toastr.options = {
            "closeButton": true,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-bottom-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        $('#dg').datagrid({
            url: '/persons/grid/list',
            type: 'post',
            dataType: 'json',
            columns: [[
                {field: 'id', title: 'Id', width: 100},
                {field: 'name', title: 'Name', width: 100},
                {field: 'surname', title: 'Surname', width: 100, align: 'right'},
                {field: 'middleName', title: 'Middle Name', width: 100, align: 'right'},
                {field: 'status', title: 'Status', width: 100, align: 'right'},
                {field: 'actions', title: 'Actions', width: 100, align: 'center', formatter: function(value,row,index){
                        return '<button class="badge bg-primary personEditLinkId" data-id="' + row.id + '">Edit</button>\n' +
                            '<button class="badge bg-danger personDeleteLinkId" data-id="' + row.id + '">Delete</button>\n';
                    }
                }
            ]]
        });

        $('#addPersonModalBtn').on("click", function() {
            $('#addPersonModal').modal('show');
        });

        $('#addPersonModalAddBtnId').on("click", function(e) {
            e.preventDefault();
            // Your add person logic here
        });

        $(document).on('click', '.personDeleteLinkId', function(e) {
            // Your delete person logic here
        });

        $(document).on('click', '.personEditLinkId', function(e) {
            // Your edit person logic here
        });

        $(document).on('click', '#editPersonModalAddBtnId', function(e) {
            // Your edit person modal form submit logic here
        });

        // Other functions and event listeners...
    });
</script>
</body>
</html>
