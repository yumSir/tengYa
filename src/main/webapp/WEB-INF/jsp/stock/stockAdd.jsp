<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--<%@ taglib uri="./struts-bean.tld" prefix="bean" %>--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>南京腾亚</title>

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="/css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="/css/nifty.min.css" rel="stylesheet">


    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="/css/demo/nifty-demo-icons.min.css" rel="stylesheet">

    <!--Demo [ DEMONSTRATION ]-->
    <link href="/css/demo/nifty-demo.min.css" rel="stylesheet">

    <!--DataTables [ OPTIONAL ]-->
    <link href="/plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/plugins/datatables/extensions/Responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!--Bootstrap Select [ OPTIONAL ]-->
    <link href="/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">


    <!--Bootstrap Tags Input [ OPTIONAL ]-->
    <link href="/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.css" rel="stylesheet">


    <!--Bootstrap Timepicker [ OPTIONAL ]-->
    <link href="/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet">

    <!--Bootstrap Datepicker [ OPTIONAL ]-->
    <link href="/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">

    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="/plugins/pace/pace.min.css" rel="stylesheet">
    <script src="/plugins/pace/pace.min.js"></script>

    <!--jQuery [ REQUIRED ]-->
    <script src="/js/jquery-2.2.4.min.js"></script>

    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="/js/bootstrap.min.js"></script>

    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="/js/nifty.min.js"></script>

    <!--Demo script [ DEMONSTRATION ]-->
    <script src="/js/demo/nifty-demo.min.js"></script>

    <!--DataTables [ OPTIONAL ]-->
    <script src="/plugins/datatables/media/js/jquery.dataTables.js"></script>
    <script src="/plugins/datatables/media/js/dataTables.bootstrap.js"></script>
    <script src="/plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
    <script src="/js/demo/tables-datatables.js"></script>

    <!--Bootstrap Timepicker [ OPTIONAL ]-->
    <script src="/plugins/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <!--Bootstrap Datepicker [ OPTIONAL ]-->
    <script src="/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

    <script src="/js/angular.min.js"></script>

</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>
<div id="container" class="effect aside-float aside-bright mainnav-lg">

    <!--NAVBAR-->
    <!--===================================================-->
    <header id="navbar">
        <div id="navbar-container" class="boxed">

            <!--Brand logo & name-->
            <!--================================-->
            <div class="navbar-header">
                <a href="http://www.njtykj.cn/" class="navbar-brand">
                    <img src="/img/logo.png" alt="南京腾亚" class="brand-icon">
                    <div class="brand-title">
                        <span class="brand-text">南京腾亚</span>
                    </div>
                </a>
            </div>
            <!--================================-->
            <!--End brand logo & name-->

            <!--Navbar Dropdown-->
            <!--================================-->
            <div class="navbar-content clearfix">
                <ul class="nav navbar-top-links pull-left">

                    <!--Navigation toogle button-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li class="tgl-menu-btn">
                        <a class="mainnav-toggle" href="#">
                            <i class="demo-pli-view-list"></i>
                        </a>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End Navigation toogle button-->
                </ul>
            </div>
            <!--================================-->
            <!--End Navbar Dropdown-->

        </div>
    </header>
    <!--===================================================-->
    <!--END NAVBAR-->

    <div class="boxed">

        <!--CONTENT CONTAINER-->
        <!--===================================================-->
        <div id="content-container">

            <!--Page content-->
            <!--===================================================-->
            <div id="page-content">

                <!-- Row selection and deletion (multiple rows) -->
                <!--===================================================-->
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">新增库存</h3>
                    </div>
                </div>
                <!--===================================================-->
                <!-- End Row selection and deletion (multiple rows) -->
                <div class="row">
                    <div class="col-lg">
                        <div class="panel">

                            <!--Input Size-->
                            <!--===================================================-->
                            <form class="form-horizontal" action="/stock/stockSave" method="post">
                                <div class="panel-body" ng-app="myApp" ng-controller="myCtrl">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">物料名称</label>
                                        <div class="col-sm-4">
                                            <select data-placeholder="请选择..." id="demo-chosen-select" tabindex="2" ng-model="productCode" class="form-control input-lg pName" required="required">
                                                <c:forEach  items="${stockList}"  var="item"  varStatus="userStatus">
                                                    <option value="${item.productCode}">${item.productName}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="text" name="productName" value="" required="required" hidden>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">物料代码</label>
                                        <div class="col-sm-4">
                                            <input oninput="preSql(this)" type="text" value="{{ productCode }}" name="productCode" class="form-control input-lg" readonly  required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">规格型号</label>
                                        <div class="col-sm-4">
                                            <input type="text" oninput="preSql(this)" name="models" class="form-control input-lg" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">单位</label>
                                        <div class="col-sm-1">
                                            <input type="text" oninput="preSql(this)" name="unit" class="form-control" value="箱" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">数量</label>
                                        <div class="col-sm-1">
                                            <input type="number" oninput="preSql(this)" name="counts" class="form-control" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-sm-9 col-sm-offset-3">
                                            <button class="btn btn-mint" type="submit">提交</button>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-warning"><a href="javascript:history.back(-1)">返回</a></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--===================================================-->
                            <!--End Input Size-->


                        </div>
                    </div>
                </div>
            </div>
            <!--===================================================-->
            <!--End page content-->
        </div>
        <!--===================================================-->
        <!--END CONTENT CONTAINER-->

        <!--MAIN NAVIGATION-->
        <!--===================================================-->
        <nav id="mainnav-container">
            <div id="mainnav">

                <!--Menu-->
                <!--================================-->
                <div id="mainnav-menu-wrap">
                    <div class="nano">
                        <div class="nano-content">


                            <ul id="mainnav-menu" class="list-group">


                                <li class="list-divider"></li>

                                <!--Menu list item-->
                                <li class="active-sub">
                                    <a href="#">
                                        <i class="demo-psi-receipt-4"></i>
                                        <span class="menu-title">业务菜单</span>
                                        <i class="arrow"></i>
                                    </a>

                                    <!--Submenu-->
                                    <ul class="collapse in">
                                        <li class="active-link"><a href="/order/selectOrderList">订单查看</a></li>
                                        <li><a href="/stock/selectStockList">库存查看</a></li>
                                        <li><a href="/stock/selectStockLackList">缺料显示</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--================================-->
                <!--End menu-->

            </div>
        </nav>
        <!--===================================================-->
        <!--END MAIN NAVIGATION-->

    </div>

    <footer id="footer">
        <p class="pad-lft">&#0169; 2020 南京腾亚面试测试系统</p>
    </footer>
    <button class="scroll-top btn">
        <i class="pci-chevron chevron-up"></i>
    </button>
</div>

</body>
</html>

<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) {
        $scope.productCode = "";
    });
</script>

<script type="text/javascript">
/* 解决下拉框绑定anjular事件，无法获取原值的问题 */
    var sel = $('.pName');//下拉菜单
    var result = $('input[name=productName]');//文本框
    result.val(sel.find('option[selected]').text());//文本框初始值为一开始就被选中的option项

    sel.change(function(event) {//change为选项改变时事件，不用click。 没用
        result.val($(this).find('option:selected').text());
        event.stopPropagation();
    });

preSql = function (obj){
    var dom = $(obj);
    var re= /select|update|delete|exec|count|’|"|=|;|>|<|%/i;
    if (re.test(dom.val().toLowerCase())){
        dom.val("");
    }
};
</script>

