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
    <script>
        function stockAdd() {
            window.location.href = '/stock/stockAdd';
        }
        function stockDel() {
            alert("模拟删除 操作成功！");
        }
    </script>
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
                        <h3 class="panel-title">即时库存</h3>
                    </div>
                    <div id="demo-custom-toolbar" class="table-toolbar-left">
                        <button id="demo-dt-addrow-btn" class="btn btn-primary" onclick="stockAdd()"><i class="demo-pli-plus"></i> 增加</button>
                        <button id="demo-dt-delete-btn" class="btn btn-danger" onclick="stockDel()"><i class="demo-pli-cross"></i> 删除</button>
                    </div>
                    <div class="panel-body">
                        <table id="demo-dt-delete" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>物料代码</th>
                                <th>物料名称</th>
                                <th class="min-tablet">规格型号</th>
                                <th class="min-desktop">单位</th>
                                <th class="min-desktop">数量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach  items="${stockList}"  var="item"  varStatus="userStatus">
                                <tr>
                                    <td>${item.productCode}</td>
                                    <td>${item.productName}</td>
                                    <td>${item.models}</td>
                                    <td>${item.unit}</td>
                                    <td>${item.counts}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--===================================================-->
                <!-- End Row selection and deletion (multiple rows) -->

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
                                        <li><a href="/order/selectOrderList">订单查看</a></li>
                                        <li class="active-link"><a href="/stock/selectStockList">库存查看</a></li>
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


