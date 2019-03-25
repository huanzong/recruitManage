$(".dibuTab li").click(function () {
    $("#dibuTab li").removeClass("active")
    $(this).addClass("active");
    var biaoqian = $(this).attr("biaoqian");
    if (biaoqian == "4") {
        window.location.href = "/h5/self.html";
    }else if(biaoqian == "3"){
        window.location.href = "/h5/app.html";
    }
});


function datagridInit(url, cols, selector) {
    var a = $('#tt');
    if (selector) a = selector;
    a.datagrid({
        pagePosition: "top",
        rownumbers: true,
        fit: true,
        pagination: true,
        fitColumns: true,
        remoteSort: true,
        singleSelect: true,
        striped: true,
        url: url,
        columns: [cols],
        toolbar: '#wu-toolbar-2',
        pagePosition: 'bottom'
    });
}

$('#tt').datagrid({
    onDblClickRow: function (index, field) {
        openEdit();
    }
});

function reload() {
    $('#tt').datagrid('reload');
}

$.fn.datebox.defaults.formatter = function (date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '年' + m + '月' + d + '日';
}

function addTab(title, url) {
    parent.addTab(title, url);
}

var alldata = null;

function openDialog(title, url, width, height, fn, data) {
    $('#dd').dialog({
        closed: false,
        modal: true,
        href: url,
        title: title,
        width: width,
        height: height,
        buttons: [{
            text: "保存",
            iconCls: 'icon-ok',
            handler: fn
        }, {
            text: "关闭",
            iconCls: 'icon-cancel',
            handler: function () {
                $('#dd').dialog('close');
            }
        }]
    });
    if (data) alldata = data;
    else alldata = null;
}

function openDetails(title, url, width, height, fn, data) {
    $('#dd').dialog({
        closed: false,
        modal: true,
        href: url,
        title: title,
        width: width,
        height: height,
        buttons: [{
            text: "关闭",
            iconCls: 'icon-cancel',
            handler: function () {
                $('#dd').dialog('close');
            }
        }]
    });
    if (data) alldata = data;
    else alldata = null;
}
