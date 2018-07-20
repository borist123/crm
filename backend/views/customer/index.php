<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Customers';
$this->params['breadcrumbs'][] = $this->title;
?>
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- 左侧视图树状菜单开始 -->
<link rel="stylesheet" href="css/bootstrapStyle/bootstrapStyle.css">
<script type="text/javascript" src="js/ztree/jquery.min.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.core.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.exedit.js"></script>
<SCRIPT type="text/javascript">
    <!--
    var setting = {
        view: {
            // addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false
        },
        // check: {
        //  enable: true
        // },
        data: {
            simpleData: {
                enable: true
            }
        },
        // edit: {
        //  enable: true
        // }
    };

    var zNodes =[
    {id:1, pId:0, name:"我的客户", open:true},
    {id:101, pId:1, name:"3天未联系"},
    {id:102, pId:1, name:"7天未联系"},
    {id:103, pId:1, name:"14天未联系"},
    {id:104, pId:1, name:"本月未联系"},
    {id:101, pId:1, name:"3天未联系"},
    {id:102, pId:1, name:"7天未联系"},
    {id:103, pId:1, name:"14天未联系"},
    {id:104, pId:1, name:"本月未联系"}, 

    {id:2, pId:0, name:"全部客户", open:false},
    {id:201, pId:2, name:"3天未联系"},
    {id:206, pId:2, name:"7天未联系"},
    {id:207, pId:2, name:"14天未联系"},
    {id:208, pId:2, name:"本月未联系"},
    
    {id:3, pId:0, name:"回收站客户", open:false},

    {id:4, pId:0, name:"客户池", open:false},
    
    ];

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            return false;
        });
    };
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };
    //-->
</SCRIPT>
<!-- 左侧视图树状菜单结束 -->

<!-- 隐藏左侧菜单开始 -->
<script>
        function switchSysBar(){
            var switchPointid=document.getElementById("switchPoint");
            if (switchPointid.getAttribute("src")=="../web/img/hidden.gif"){
                switchPointid.src="../web/img/show.gif"
                document.all("customer_left").style.display="none"
            }else{
                switchPointid.src="../web/img/hidden.gif"
                document.all("customer_left").style.display=""
            }
        }
</script>
<!-- 隐藏左侧菜单结束 -->
<div class="customer">
        <div class="customer_left" id="customer_left">
            <div class="customer_left_bt">
                    <div style="float:left;margin-left:8px;">
                        <span class="btn btn-green" type="button" style="width:105px;height:30px;margin-top:7px;">新建客户</span>
                        <span class="btn btn-green" type="button" style="width:105px;height:30px;margin-left:2px;margin-top:7px;">导入客户</span>
                    </div>
            </div>
            <div class="customer_left_search">
                <div style="margin-left:-80px;"><input style="margin-top:4px;" type="checkbox">在<span><我的客户></span>中搜索</div>
                <div style="float:left;margin-left:2px;margin-top:4px;">
                    <select style="background:#E8E8E8;height:22px;">
                        <option>客户姓名</option>
                        <option>企业名称</option>
                        <option>电话号码1</option>
                        <option>电话号码2</option>
                    </select>
                </div>
                <div style="float:left;margin-top:4px;""><input type="text" style="width:90px;height:22px;"></div>
                <div style="float:left;margin-top:3px;"><button style="height:23px;" type="button">搜索</button></div>
                <div style="float:right;margin-top:5px;"><button style="margin-right:5px;">高级搜索</button></div>
            </div>
            <div class="customer_view">
                <div class="customer_view_title" style="line-height:36px;">
                    <span style="padding-left:3px;">数据视图&amp;工具</span>
                    <span title="添加修改视图" style="padding-left:60px;"><i class="glyphicon glyphicon-plus"></i></span>
                    <span title="更新视图数据总数" style="padding-left:10px;"><i class="glyphicon glyphicon-refresh"></i></span></span>
                </div>
                <div class="customer_view_menu" style="width:228px;height:325px;overflow:auto;">
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
        </div>
        <div class="customer_x">
            <span><a href="#" onclick="switchSysBar()"><img id="switchPoint" src="../web/img/hidden.gif" style="width:4px; border:0px;" /></a></span>
        </div>
        <div class="customer_right">
            <div class="customer_lst">
                <div class="customer_lst_top"><span style="color:red;font-weight:bold;margin-top:8px;">我的客户</span></div>
                <div class="customer_lst_operating">
                    <span id="client_tables_bt_export" class="btn-gray" style="margin-left: 3px; margin-top: 2px;"><span title="导出当前表格数据">导出</span></span>
                    <span id="client_tables_bt_export" class="btn-gray" style="margin-left: 1px; margin-top: 2px;"><span title="分配转移客户给他人">分配</span></span>
                    <span id="client_tables_bt_export" class="btn-gray" style="margin-left: 1px; margin-top: 2px;"><span title="释放致客户池">释放</span></span>
                    <span id="client_tables_bt_export" class="btn-gray" style="margin-left: 1px; margin-top: 2px;"><span title="将客户放入回收站">放入回收站</span></span>
                </div>
                <!-- <div class="customer-index">

                    <p>
                        <?= Html::a('Create Customer', ['create'], ['class' => 'btn btn-success']) ?>
                    </p>
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        // 'filterModel' => $searchModel,
                        'columns' => [
                            // ['class' => 'yii\grid\SerialColumn'],

                            'id',
                            'cus_name',
                            'cus_sex',
                            'cus_phone1',
                            'cus_phone2',
                            // 'insert_time:datetime',
                            // 'update_time:datetime',
                            // 'client_resume',
                            // 'user_id',

                            ['class' => 'yii\grid\ActionColumn'],
                        ],
                    ]); ?>
                </div> -->
            </div>
        </div>
</div>     