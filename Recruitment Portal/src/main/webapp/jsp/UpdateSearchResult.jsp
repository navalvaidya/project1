<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>
<%@page import="java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<style type="text/css">
  .filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}
  
  </style>

</head>
<body>
<%
String keyword=request.getParameter("updatesearch");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
PreparedStatement stat1 = con.prepareStatement("SELECT * FROM EMPLOYEE WHERE department REGEXP ? OR name REGEXP ? OR designation REGEXP ? OR experience REGEXP ?");
stat1.setString(1, keyword);
stat1.setString(2, keyword);
stat1.setString(3, keyword);
stat1.setString(4, keyword);
ResultSet result=stat1.executeQuery();        
%>

<nav class="navbar navbar-inverse navbar-fixed-top" >
<div class="container-fluid">
<div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">                    
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
       </button>
   <a class="navbar-brand " href="/recruitmentportal/main.html">IDeas</a>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
        <li><a href="/recruitmentportal/jsp/NewEntryForm.jsp">New Entry</a></li>
        <li><a href="/recruitmentportal/jsp/UpdateEntries.jsp">Update Information</a></li>
        <li><a href="#">Upload from Excel</a></li>
      </ul>
     
      </div>
    </div>
 </nav>
 
<div class="container" >
<div class="jumbotron">
<h3>Search Results</h3>
<div class="row">
        <div class="panel panel-primary filterable">
 <div class="panel-heading">
                <h3 class="panel-title">Search Results</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
	<table class="table table-bordered" id="mytable">
		 <thead>
		  <tr class="filters">
		   <th>
		     <input type="text" class="form-control" placeholder="Department" disabled>
		     <span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		   <th>
		   	<input type="text" class="form-control" placeholder="Name" disabled>
		   	<span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		   <th>
		   	<input type="text" class="form-control" placeholder="Designation" disabled>
		   	<span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		   <th>
		   	<input type="text" class="form-control" placeholder="Experience" disabled>
		   	<span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		   <th>
		   	<input type="text" class="form-control" placeholder="comments" disabled>
		   	<span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		   <th>
		   	<input type="text" class="form-control" placeholder="resume" disabled>
		   	<span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		   <th>
		   	<input type="text" class="form-control" placeholder="other files" disabled>
		   	<span class="order"><span class="caret" style="margin: 10px 5px;"></span></span>
		   </th>
		 </tr>
		</thead>
		<tbody>
		<%
	while(result.next())
	{
		%>
		
		 <tr>
		 
		  <td><a href="/recruitmentportal/jsp/UpdateForm.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("department") %></a></td>
		  <td><a href="/recruitmentportal/jsp/UpdateForm.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("name") %></a></td>
		  <td><a href="/recruitmentportal/jsp/UpdateForm.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("designation") %></a></td>
		  <td><a href="/recruitmentportal/jsp/UpdateForm.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("experience") %></a></td>
		  <td><a href="/recruitmentportal/jsp/UpdateForm.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("comments") %></a></td>
		  <td><a href="/recruitmentportal/jsp/ResumeOtherUpdate.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("resumelink") %></a></td> 			  		 
		  <td><a href="/recruitmentportal/jsp/OtherFileUpdate.jsp?id=<%=result.getInt("id") %>" ><%=result.getString("otherfile") %></a></td>
		 
		 </tr>
		
		<% 		
	}
		%>
		</tbody>
		</table>
		</div>
		</div>
		</div>
		</div>
		<%
		stat1.close();
		con.close();
		%>
		 <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$("#mytable").tablesorter();
    	
        $('.filterable .btn-filter').click(function(){
            var $panel = $(this).parents('.filterable'),
            $filters = $panel.find('.filters input'),
            $tbody = $panel.find('.table tbody');
            if ($filters.prop('disabled') == true) {
                $filters.prop('disabled', false);
                $filters.first().focus();
            } else {
                $filters.val('').prop('disabled', true);
                $tbody.find('.no-result').remove();
                $tbody.find('tr').show();
            }
        });

        $('.filterable .filters input').keyup(function(e){
            /* Ignore tab key */
            var code = e.keyCode || e.which;
            if (code == '9') return;
            /* Useful DOM data and selectors */
            var $input = $(this),
            inputContent = $input.val().toLowerCase(),
            $panel = $input.parents('.filterable'),
            column = $panel.find('.filters th').index($input.parents('th')),
            $table = $panel.find('.table'),
            $rows = $table.find('tbody tr');
            /* Dirtiest filter function ever ;) */
            var $filteredRows = $rows.filter(function(){
                var value = $(this).find('td').eq(column).text().toLowerCase();
                return value.indexOf(inputContent) === -1;
            });
            /* Clean previous no-result if exist */
            $table.find('tbody .no-result').remove();
            /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
            $rows.show();
            $filteredRows.hide();
            /* Prepend no-result row if all rows are filtered */
            if ($filteredRows.length === $rows.length) {
                $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
            }
        });
    });
</script>
<script type="text/javascript">
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof module&&"object"==typeof module.exports?module.exports=a(require("jquery")):a(jQuery)}(function(a){return function(a){"use strict";a.extend({tablesorter:new function(){function b(){var a=arguments[0],b=arguments.length>1?Array.prototype.slice.call(arguments):a;"undefined"!=typeof console&&"undefined"!=typeof console.log?console[/error/i.test(a)?"error":/warn/i.test(a)?"warn":"log"](b):alert(b)}function c(a,c){b(a+" ("+((new Date).getTime()-c.getTime())+"ms)")}function d(a){for(var b in a)return!1;return!0}function e(c,d,e,f){for(var g,h,i=u.parsers.length,j=!1,k="",l=!0;""===k&&l;)e++,d[e]?(j=d[e].cells[f],k=u.getElementText(c,j,f),h=a(j),c.debug&&b("Checking if value was empty on row "+e+", column: "+f+': "'+k+'"')):l=!1;for(;--i>=0;)if(g=u.parsers[i],g&&"text"!==g.id&&g.is&&g.is(k,c.table,j,h))return g;return u.getParserById("text")}function f(a,d){var f,g,h,i,j,k,l,m,n,o,p,q,r=a.table,s=0,t="";if(a.$tbodies=a.$table.children("tbody:not(."+a.cssInfoBlock+")"),p="undefined"==typeof d?a.$tbodies:d,q=p.length,0===q)return a.debug?b("Warning: *Empty table!* Not building a parser cache"):"";for(a.debug&&(o=new Date,b("Detecting parsers for each column")),g={extractors:[],parsers:[]};q>s;){if(f=p[s].rows,f.length)for(h=a.columns,i=0;h>i;i++)j=a.$headerIndexed[i],k=u.getColumnData(r,a.headers,i),n=u.getParserById(u.getData(j,k,"extractor")),m=u.getParserById(u.getData(j,k,"sorter")),l="false"===u.getData(j,k,"parser"),a.empties[i]=(u.getData(j,k,"empty")||a.emptyTo||(a.emptyToBottom?"bottom":"top")).toLowerCase(),a.strings[i]=(u.getData(j,k,"string")||a.stringTo||"max").toLowerCase(),l&&(m=u.getParserById("no-parser")),n||(n=!1),m||(m=e(a,f,-1,i)),a.debug&&(t+="column:"+i+"; extractor:"+n.id+"; parser:"+m.id+"; string:"+a.strings[i]+"; empty: "+a.empties[i]+"\n"),g.parsers[i]=m,g.extractors[i]=n;s+=g.parsers.length?q:1}a.debug&&(b(t?t:"No parsers detected"),c("Completed detecting parsers",o)),a.parsers=g.parsers,a.extractors=g.extractors}function g(d,e){var f,g,h,i,j,k,l,m,n,o,p,q,r,s,t=d.config,v=t.parsers;if(t.$tbodies=t.$table.children("tbody:not(."+t.cssInfoBlock+")"),l="undefined"==typeof e?t.$tbodies:e,t.cache={},t.totalRows=0,!v)return t.debug?b("Warning: *Empty table!* Not building a cache"):"";for(t.debug&&(o=new Date),t.showProcessing&&u.isProcessing(d,!0),k=0;k<l.length;k++){for(s=[],f=t.cache[k]={normalized:[]},p=l[k]&&l[k].rows.length||0,i=0;p>i;++i)if(q={child:[],raw:[]},m=a(l[k].rows[i]),n=[],m.hasClass(t.cssChildRow)&&0!==i)for(g=f.normalized.length-1,r=f.normalized[g][t.columns],r.$row=r.$row.add(m),m.prev().hasClass(t.cssChildRow)||m.prev().addClass(u.css.cssHasChild),h=m.children("th, td"),g=r.child.length,r.child[g]=[],j=0;j<t.columns;j++)r.child[g][j]=u.getParsedText(t,h[j],j);else{for(q.$row=m,q.order=i,j=0;j<t.columns;++j)"undefined"!=typeof v[j]?(g=u.getElementText(t,m[0].cells[j],j),q.raw.push(g),h=u.getParsedText(t,m[0].cells[j],j,g),n.push(h),"numeric"===(v[j].type||"").toLowerCase()&&(s[j]=Math.max(Math.abs(h)||0,s[j]||0))):t.debug&&b("No parser found for cell:",m[0].cells[j],"does it have a header?");n[t.columns]=q,f.normalized.push(n)}f.colMax=s,t.totalRows+=f.normalized.length}t.showProcessing&&u.isProcessing(d),t.debug&&c("Building cache for "+p+" rows",o)}function h(a,b){var e,f,g,h,i,j,k,l=a.config,m=l.widgetOptions,n=l.$tbodies,o=[],p=l.cache;if(d(p))return l.appender?l.appender(a,o):a.isUpdating?l.$table.trigger("updateComplete",a):"";for(l.debug&&(k=new Date),j=0;j<n.length;j++)if(g=n.eq(j),g.length){for(h=u.processTbody(a,g,!0),e=p[j].normalized,f=e.length,i=0;f>i;i++)o.push(e[i][l.columns].$row),l.appender&&(!l.pager||l.pager.removeRows&&m.pager_removeRows||l.pager.ajax)||h.append(e[i][l.columns].$row);u.processTbody(a,h,!1)}l.appender&&l.appender(a,o),l.debug&&c("Rebuilt table",k),b||l.appender||u.applyWidget(a),a.isUpdating&&l.$table.trigger("updateComplete",a)}function i(a){return/^d/i.test(a)||1===a}function j(d){var e,f,g,h,j,k,m,n,o=d.config;for(o.headerList=[],o.headerContent=[],o.debug&&(m=new Date),o.columns=u.computeColumnIndex(o.$table.children("thead, tfoot").children("tr")),h=o.cssIcon?'<i class="'+(o.cssIcon===u.css.icon?u.css.icon:o.cssIcon+" "+u.css.icon)+'"></i>':"",o.$headers=a(a.map(a(d).find(o.selectorHeaders),function(b,c){return f=a(b),f.parent().hasClass(o.cssIgnoreRow)?void 0:(e=u.getColumnData(d,o.headers,c,!0),o.headerContent[c]=f.html(),""===o.headerTemplate||f.find("."+u.css.headerIn).length||(j=o.headerTemplate.replace(/\{content\}/g,f.html()).replace(/\{icon\}/g,f.find("."+u.css.icon).length?"":h),o.onRenderTemplate&&(g=o.onRenderTemplate.apply(f,[c,j]),g&&"string"==typeof g&&(j=g)),f.html('<div class="'+u.css.headerIn+'">'+j+"</div>")),o.onRenderHeader&&o.onRenderHeader.apply(f,[c,o,o.$table]),b.column=parseInt(f.attr("data-column"),10),b.order=i(u.getData(f,e,"sortInitialOrder")||o.sortInitialOrder)?[1,0,2]:[0,1,2],b.count=-1,b.lockedOrder=!1,k=u.getData(f,e,"lockedOrder")||!1,"undefined"!=typeof k&&k!==!1&&(b.order=b.lockedOrder=i(k)?[1,1,1]:[0,0,0]),f.addClass(u.css.header+" "+o.cssHeader),o.headerList[c]=b,f.parent().addClass(u.css.headerRow+" "+o.cssHeaderRow).attr("role","row"),o.tabIndex&&f.attr("tabindex",0),b)})),o.$headerIndexed=[],n=0;n<o.columns;n++)f=o.$headers.filter('[data-column="'+n+'"]'),o.$headerIndexed[n]=f.not(".sorter-false").length?f.not(".sorter-false").filter(":last"):f.filter(":last");a(d).find(o.selectorHeaders).attr({scope:"col",role:"columnheader"}),l(d),o.debug&&(c("Built headers:",m),b(o.$headers))}function k(a,b,c){var d=a.config;d.$table.find(d.selectorRemove).remove(),f(d),g(a),s(d,b,c)}function l(a){var b,c,d,e,f=a.config,g=f.$headers.length;for(b=0;g>b;b++)d=f.$headers.eq(b),e=u.getColumnData(a,f.headers,b,!0),c="false"===u.getData(d,e,"sorter")||"false"===u.getData(d,e,"parser"),d[0].sortDisabled=c,d[c?"addClass":"removeClass"]("sorter-false").attr("aria-disabled",""+c),a.id&&(c?d.removeAttr("aria-controls"):d.attr("aria-controls",a.id))}function m(b){var c,d,e,f,g,h,i,j,k=b.config,l=k.sortList,m=l.length,n=u.css.sortNone+" "+k.cssNone,o=[u.css.sortAsc+" "+k.cssAsc,u.css.sortDesc+" "+k.cssDesc],p=[k.cssIconAsc,k.cssIconDesc,k.cssIconNone],q=["ascending","descending"],r=a(b).find("tfoot tr").children().add(a(k.namespace+"_extra_headers")).removeClass(o.join(" "));for(k.$headers.removeClass(o.join(" ")).addClass(n).attr("aria-sort","none").find("."+u.css.icon).removeClass(p.join(" ")).addClass(p[2]),e=0;m>e;e++)if(2!==l[e][1]&&(c=k.$headers.not(".sorter-false").filter('[data-column="'+l[e][0]+'"]'+(1===m?":last":"")),c.length)){for(f=0;f<c.length;f++)c[f].sortDisabled||c.eq(f).removeClass(n).addClass(o[l[e][1]]).attr("aria-sort",q[l[e][1]]).find("."+u.css.icon).removeClass(p[2]).addClass(p[l[e][1]]);r.length&&r.filter('[data-column="'+l[e][0]+'"]').removeClass(n).addClass(o[l[e][1]])}for(m=k.$headers.length,g=k.$headers.not(".sorter-false"),e=0;m>e;e++)h=g.eq(e),h.length&&(d=g[e],i=d.order[(d.count+1)%(k.sortReset?3:2)],j=a.trim(h.text())+": "+u.language[h.hasClass(u.css.sortAsc)?"sortAsc":h.hasClass(u.css.sortDesc)?"sortDesc":"sortNone"]+u.language[0===i?"nextAsc":1===i?"nextDesc":"nextNone"],h.attr("aria-label",j))}function n(b,c){var d,e,f,g,h,i,j,k,l=b.config,m=c||l.sortList,n=m.length;for(l.sortList=[],h=0;n>h;h++)if(k=m[h],d=parseInt(k[0],10),d<l.columns&&l.$headerIndexed[d]){switch(g=l.$headerIndexed[d][0],e=(""+k[1]).match(/^(1|d|s|o|n)/),e=e?e[0]:""){case"1":case"d":e=1;break;case"s":e=i||0;break;case"o":j=g.order[(i||0)%(l.sortReset?3:2)],e=0===j?1:1===j?0:2;break;case"n":g.count=g.count+1,e=g.order[g.count%(l.sortReset?3:2)];break;default:e=0}i=0===h?e:i,f=[d,parseInt(e,10)||0],l.sortList.push(f),e=a.inArray(f[1],g.order),g.count=e>=0?e:f[1]%(l.sortReset?3:2)}}function o(a,b){return a&&a[b]?a[b].type||"":""}function p(b,c,d){if(b.isUpdating)return setTimeout(function(){p(b,c,d)},50);var e,f,g,i,j,k,l,n=b.config,o=!d[n.sortMultiSortKey],r=n.$table,s=n.$headers.length;if(r.trigger("sortStart",b),c.count=d[n.sortResetKey]?2:(c.count+1)%(n.sortReset?3:2),n.sortRestart)for(f=c,g=0;s>g;g++)l=n.$headers.eq(g),l[0]===f||!o&&l.is("."+u.css.sortDesc+",."+u.css.sortAsc)||(l[0].count=-1);if(f=parseInt(a(c).attr("data-column"),10),o){if(n.sortList=[],null!==n.sortForce)for(e=n.sortForce,i=0;i<e.length;i++)e[i][0]!==f&&n.sortList.push(e[i]);if(j=c.order[c.count],2>j&&(n.sortList.push([f,j]),c.colSpan>1))for(i=1;i<c.colSpan;i++)n.sortList.push([f+i,j])}else{if(n.sortAppend&&n.sortList.length>1)for(i=0;i<n.sortAppend.length;i++)k=u.isValueInArray(n.sortAppend[i][0],n.sortList),k>=0&&n.sortList.splice(k,1);if(u.isValueInArray(f,n.sortList)>=0)for(i=0;i<n.sortList.length;i++)k=n.sortList[i],j=n.$headerIndexed[k[0]][0],k[0]===f&&(k[1]=j.order[c.count],2===k[1]&&(n.sortList.splice(i,1),j.count=-1));else if(j=c.order[c.count],2>j&&(n.sortList.push([f,j]),c.colSpan>1))for(i=1;i<c.colSpan;i++)n.sortList.push([f+i,j])}if(null!==n.sortAppend)for(e=n.sortAppend,i=0;i<e.length;i++)e[i][0]!==f&&n.sortList.push(e[i]);r.trigger("sortBegin",b),setTimeout(function(){m(b),q(b),h(b),r.trigger("sortEnd",b)},1)}function q(a){var b,e,f,g,h,i,j,k,l,m,n,p=0,q=a.config,r=q.textSorter||"",s=q.sortList,t=s.length,v=q.$tbodies.length;if(!q.serverSideSorting&&!d(q.cache)){for(q.debug&&(h=new Date),e=0;v>e;e++)i=q.cache[e].colMax,j=q.cache[e].normalized,j.sort(function(c,d){for(b=0;t>b;b++){if(g=s[b][0],k=s[b][1],p=0===k,q.sortStable&&c[g]===d[g]&&1===t)return c[q.columns].order-d[q.columns].order;if(f=/n/i.test(o(q.parsers,g)),f&&q.strings[g]?(f="boolean"==typeof q.string[q.strings[g]]?(p?1:-1)*(q.string[q.strings[g]]?-1:1):q.strings[g]?q.string[q.strings[g]]||0:0,l=q.numberSorter?q.numberSorter(c[g],d[g],p,i[g],a):u["sortNumeric"+(p?"Asc":"Desc")](c[g],d[g],f,i[g],g,a)):(m=p?c:d,n=p?d:c,l="function"==typeof r?r(m[g],n[g],p,g,a):"object"==typeof r&&r.hasOwnProperty(g)?r[g](m[g],n[g],p,g,a):u["sortNatural"+(p?"Asc":"Desc")](c[g],d[g],g,a,q)),l)return l}return c[q.columns].order-d[q.columns].order});q.debug&&c("Sorting on "+s.toString()+" and dir "+k+" time",h)}}function r(b,c){b.table.isUpdating&&b.$table.trigger("updateComplete",b.table),a.isFunction(c)&&c(b.table)}function s(b,c,d){var e=a.isArray(c)?c:b.sortList,f="undefined"==typeof c?b.resort:c;f===!1||b.serverSideSorting||b.table.isProcessing?(r(b,d),u.applyWidget(b.table,!1)):e.length?b.$table.trigger("sorton",[e,function(){r(b,d)},!0]):b.$table.trigger("sortReset",[function(){r(b,d),u.applyWidget(b.table,!1)}])}function t(b){var c=b.config,e=c.$table,i="sortReset update updateRows updateCell updateAll addRows updateComplete sorton appendCache updateCache applyWidgetId applyWidgets refreshWidgets destroy mouseup mouseleave ".split(" ").join(c.namespace+" ");e.unbind(i.replace(/\s+/g," ")).bind("sortReset"+c.namespace,function(d,e){d.stopPropagation(),c.sortList=[],m(b),q(b),h(b),a.isFunction(e)&&e(b)}).bind("updateAll"+c.namespace,function(a,d,e){a.stopPropagation(),b.isUpdating=!0,u.refreshWidgets(b,!0,!0),j(b),u.bindEvents(b,c.$headers,!0),t(b),k(b,d,e)}).bind("update"+c.namespace+" updateRows"+c.namespace,function(a,c,d){a.stopPropagation(),b.isUpdating=!0,l(b),k(b,c,d)}).bind("updateCell"+c.namespace,function(d,f,g,h){d.stopPropagation(),b.isUpdating=!0,e.find(c.selectorRemove).remove();var i,j,k,l,m=c.$tbodies,n=a(f),o=m.index(a.fn.closest?n.closest("tbody"):n.parents("tbody").filter(":first")),p=c.cache[o],q=a.fn.closest?n.closest("tr"):n.parents("tr").filter(":first");f=n[0],m.length&&o>=0&&(j=m.eq(o).find("tr").index(q),l=p.normalized[j],k=n.index(),i=u.getParsedText(c,f,k),l[k]=i,l[c.columns].$row=q,"numeric"===(c.parsers[k].type||"").toLowerCase()&&(p.colMax[k]=Math.max(Math.abs(i)||0,p.colMax[k]||0)),i="undefined"!==g?g:c.resort,i!==!1?s(c,i,h):(a.isFunction(h)&&h(b),c.$table.trigger("updateComplete",c.table)))}).bind("addRows"+c.namespace,function(e,g,h,i){if(e.stopPropagation(),b.isUpdating=!0,d(c.cache))l(b),k(b,h,i);else{g=a(g).attr("role","row");var j,m,n,o,p,q=g.filter("tr").length,r=c.$tbodies.index(g.parents("tbody").filter(":first"));for(c.parsers&&c.parsers.length||f(c),j=0;q>j;j++){for(n=g[j].cells.length,p=[],o={child:[],$row:g.eq(j),order:c.cache[r].normalized.length},m=0;n>m;m++)p[m]=u.getParsedText(c,g[j].cells[m],m),"numeric"===(c.parsers[m].type||"").toLowerCase()&&(c.cache[r].colMax[m]=Math.max(Math.abs(p[m])||0,c.cache[r].colMax[m]||0));p.push(o),c.cache[r].normalized.push(p)}s(c,h,i)}}).bind("updateComplete"+c.namespace,function(){b.isUpdating=!1}).bind("sorton"+c.namespace,function(c,f,i,j){var k=b.config;c.stopPropagation(),e.trigger("sortStart",this),n(b,f),m(b),k.delayInit&&d(k.cache)&&g(b),e.trigger("sortBegin",this),q(b),h(b,j),e.trigger("sortEnd",this),u.applyWidget(b),a.isFunction(i)&&i(b)}).bind("appendCache"+c.namespace,function(c,d,e){c.stopPropagation(),h(b,e),a.isFunction(d)&&d(b)}).bind("updateCache"+c.namespace,function(d,e,h){c.parsers&&c.parsers.length||f(c,h),g(b,h),a.isFunction(e)&&e(b)}).bind("applyWidgetId"+c.namespace,function(a,d){a.stopPropagation(),u.getWidgetById(d).format(b,c,c.widgetOptions)}).bind("applyWidgets"+c.namespace,function(a,c){a.stopPropagation(),u.applyWidget(b,c)}).bind("refreshWidgets"+c.namespace,function(a,c,d){a.stopPropagation(),u.refreshWidgets(b,c,d)}).bind("destroy"+c.namespace,function(a,c,d){a.stopPropagation(),u.destroy(b,c,d)}).bind("resetToLoadState"+c.namespace,function(){u.removeWidget(b,!0,!1),c=a.extend(!0,u.defaults,c.originalSettings),b.hasInitialized=!1,u.setup(b,c)})}var u=this;u.version="2.22.1",u.parsers=[],u.widgets=[],u.defaults={theme:"default",widthFixed:!1,showProcessing:!1,headerTemplate:"{content}",onRenderTemplate:null,onRenderHeader:null,cancelSelection:!0,tabIndex:!0,dateFormat:"mmddyyyy",sortMultiSortKey:"shiftKey",sortResetKey:"ctrlKey",usNumberFormat:!0,delayInit:!1,serverSideSorting:!1,resort:!0,headers:{},ignoreCase:!0,sortForce:null,sortList:[],sortAppend:null,sortStable:!1,sortInitialOrder:"asc",sortLocaleCompare:!1,sortReset:!1,sortRestart:!1,emptyTo:"bottom",stringTo:"max",textExtraction:"basic",textAttribute:"data-text",textSorter:null,numberSorter:null,widgets:[],widgetOptions:{zebra:["even","odd"]},initWidgets:!0,widgetClass:"widget-{name}",initialized:null,tableClass:"",cssAsc:"",cssDesc:"",cssNone:"",cssHeader:"",cssHeaderRow:"",cssProcessing:"",cssChildRow:"tablesorter-childRow",cssIcon:"tablesorter-icon",cssIconNone:"",cssIconAsc:"",cssIconDesc:"",cssInfoBlock:"tablesorter-infoOnly",cssNoSort:"tablesorter-noSort",cssIgnoreRow:"tablesorter-ignoreRow",pointerClick:"click",pointerDown:"mousedown",pointerUp:"mouseup",selectorHeaders:"> thead th, > thead td",selectorSort:"th, td",selectorRemove:".remove-me",debug:!1,headerList:[],empties:{},strings:{},parsers:[]},u.css={table:"tablesorter",cssHasChild:"tablesorter-hasChildRow",childRow:"tablesorter-childRow",colgroup:"tablesorter-colgroup",header:"tablesorter-header",headerRow:"tablesorter-headerRow",headerIn:"tablesorter-header-inner",icon:"tablesorter-icon",processing:"tablesorter-processing",sortAsc:"tablesorter-headerAsc",sortDesc:"tablesorter-headerDesc",sortNone:"tablesorter-headerUnSorted"},u.language={sortAsc:"Ascending sort applied, ",sortDesc:"Descending sort applied, ",sortNone:"No sort applied, ",nextAsc:"activate to apply an ascending sort",nextDesc:"activate to apply a descending sort",nextNone:"activate to remove the sort"},u.instanceMethods={},u.log=b,u.benchmark=c,u.getElementText=function(b,c,d){if(!c)return"";var e,f=b.textExtraction||"",g=c.jquery?c:a(c);return"string"==typeof f?"basic"===f&&"undefined"!=typeof(e=g.attr(b.textAttribute))?a.trim(e):a.trim(c.textContent||g.text()):"function"==typeof f?a.trim(f(g[0],b.table,d)):"function"==typeof(e=u.getColumnData(b.table,f,d))?a.trim(e(g[0],b.table,d)):a.trim(g[0].textContent||g.text())},u.getParsedText=function(a,b,c,d){"undefined"==typeof d&&(d=u.getElementText(a,b,c));var e=""+d,f=a.parsers[c],g=a.extractors[c];return f&&(g&&"function"==typeof g.format&&(d=g.format(d,a.table,b,c)),e="no-parser"===f.id?"":f.format(""+d,a.table,b,c),a.ignoreCase&&"string"==typeof e&&(e=e.toLowerCase())),e},u.construct=function(b){return this.each(function(){var c=this,d=a.extend(!0,{},u.defaults,b,u.instanceMethods);d.originalSettings=b,!c.hasInitialized&&u.buildTable&&"TABLE"!==this.nodeName?u.buildTable(c,d):u.setup(c,d)})},u.setup=function(c,d){if(!c||!c.tHead||0===c.tBodies.length||c.hasInitialized===!0)return d.debug?b("ERROR: stopping initialization! No table, thead, tbody or tablesorter has already been initialized"):"";var e="",h=a(c),i=a.metadata;c.hasInitialized=!1,c.isProcessing=!0,c.config=d,a.data(c,"tablesorter",d),d.debug&&a.data(c,"startoveralltimer",new Date),d.supportsDataObject=function(a){return a[0]=parseInt(a[0],10),a[0]>1||1===a[0]&&parseInt(a[1],10)>=4}(a.fn.jquery.split(".")),d.string={max:1,min:-1,emptymin:1,emptymax:-1,zero:0,none:0,"null":0,top:!0,bottom:!1},d.emptyTo=d.emptyTo.toLowerCase(),d.stringTo=d.stringTo.toLowerCase(),/tablesorter\-/.test(h.attr("class"))||(e=""!==d.theme?" tablesorter-"+d.theme:""),d.table=c,d.$table=h.addClass(u.css.table+" "+d.tableClass+e).attr("role","grid"),d.$headers=h.find(d.selectorHeaders),d.namespace?d.namespace="."+d.namespace.replace(/\W/g,""):d.namespace=".tablesorter"+Math.random().toString(16).slice(2),d.$table.children().children("tr").attr("role","row"),d.$tbodies=h.children("tbody:not(."+d.cssInfoBlock+")").attr({"aria-live":"polite","aria-relevant":"all"}),d.$table.children("caption").length&&(e=d.$table.children("caption")[0],e.id||(e.id=d.namespace.slice(1)+"caption"),d.$table.attr("aria-labelledby",e.id)),d.widgetInit={},d.textExtraction=d.$table.attr("data-text-extraction")||d.textExtraction||"basic",j(c),u.fixColumnWidth(c),u.applyWidgetOptions(c,d),f(d),d.totalRows=0,d.delayInit||g(c),u.bindEvents(c,d.$headers,!0),t(c),d.supportsDataObject&&"undefined"!=typeof h.data().sortlist?d.sortList=h.data().sortlist:i&&h.metadata()&&h.metadata().sortlist&&(d.sortList=h.metadata().sortlist),u.applyWidget(c,!0),d.sortList.length>0?h.trigger("sorton",[d.sortList,{},!d.initWidgets,!0]):(m(c),d.initWidgets&&u.applyWidget(c,!1)),d.showProcessing&&h.unbind("sortBegin"+d.namespace+" sortEnd"+d.namespace).bind("sortBegin"+d.namespace+" sortEnd"+d.namespace,function(a){clearTimeout(d.processTimer),u.isProcessing(c),"sortBegin"===a.type&&(d.processTimer=setTimeout(function(){u.isProcessing(c,!0)},500))}),c.hasInitialized=!0,c.isProcessing=!1,d.debug&&u.benchmark("Overall initialization time",a.data(c,"startoveralltimer")),h.trigger("tablesorter-initialized",c),"function"==typeof d.initialized&&d.initialized(c)},u.fixColumnWidth=function(b){b=a(b)[0];var c,d,e,f,g,h=b.config,i=h.$table.children("colgroup");if(i.length&&i.hasClass(u.css.colgroup)&&i.remove(),h.widthFixed&&0===h.$table.children("colgroup").length){for(i=a('<colgroup class="'+u.css.colgroup+'">'),c=h.$table.width(),e=h.$tbodies.find("tr:first").children(":visible"),f=e.length,g=0;f>g;g++)d=parseInt(e.eq(g).width()/c*1e3,10)/10+"%",i.append(a("<col>").css("width",d));h.$table.prepend(i)}},u.getColumnData=function(b,c,d,e,f){if("undefined"!=typeof c&&null!==c){b=a(b)[0];var g,h,i=b.config,j=f||i.$headers,k=i.$headerIndexed&&i.$headerIndexed[d]||j.filter('[data-column="'+d+'"]:last');if(c[d])return e?c[d]:c[j.index(k)];for(h in c)if("string"==typeof h&&(g=k.filter(h).add(k.find(h)),g.length))return c[h]}},u.computeColumnIndex=function(b){var c,d,e,f,g,h,i,j,k,l,m,n,o=[],p=[],q={};for(c=0;c<b.length;c++)for(i=b[c].cells,d=0;d<i.length;d++){for(h=i[d],g=a(h),j=h.parentNode.rowIndex,k=j+"-"+g.index(),l=h.rowSpan||1,m=h.colSpan||1,"undefined"==typeof o[j]&&(o[j]=[]),e=0;e<o[j].length+1;e++)if("undefined"==typeof o[j][e]){n=e;break}for(q[k]=n,g.attr({"data-column":n}),e=j;j+l>e;e++)for("undefined"==typeof o[e]&&(o[e]=[]),p=o[e],f=n;n+m>f;f++)p[f]="x"}return p.length},u.isProcessing=function(b,c,d){b=a(b);var e=b[0].config,f=d||b.find("."+u.css.header);c?("undefined"!=typeof d&&e.sortList.length>0&&(f=f.filter(function(){return this.sortDisabled?!1:u.isValueInArray(parseFloat(a(this).attr("data-column")),e.sortList)>=0})),b.add(f).addClass(u.css.processing+" "+e.cssProcessing)):b.add(f).removeClass(u.css.processing+" "+e.cssProcessing)},u.processTbody=function(b,c,d){b=a(b)[0];var e;return d?(b.isProcessing=!0,c.before('<span class="tablesorter-savemyplace"/>'),e=a.fn.detach?c.detach():c.remove()):(e=a(b).find("span.tablesorter-savemyplace"),c.insertAfter(e),e.remove(),void(b.isProcessing=!1))},u.clearTableBody=function(b){a(b)[0].config.$tbodies.children().detach()},u.bindEvents=function(b,c,e){b=a(b)[0];var f,h=null,i=b.config;e!==!0&&(c.addClass(i.namespace.slice(1)+"_extra_headers"),f=a.fn.closest?c.closest("table")[0]:c.parents("table")[0],f&&"TABLE"===f.nodeName&&f!==b&&a(f).addClass(i.namespace.slice(1)+"_extra_table")),f=(i.pointerDown+" "+i.pointerUp+" "+i.pointerClick+" sort keyup ").replace(/\s+/g," ").split(" ").join(i.namespace+" "),c.find(i.selectorSort).add(c.filter(i.selectorSort)).unbind(f).bind(f,function(e,f){var j,k,l=a(e.target),m=" "+e.type+" ";if(!(1!==(e.which||e.button)&&!m.match(" "+i.pointerClick+" | sort | keyup ")||" keyup "===m&&13!==e.which||m.match(" "+i.pointerClick+" ")&&"undefined"!=typeof e.which||m.match(" "+i.pointerUp+" ")&&h!==e.target&&f!==!0)){if(m.match(" "+i.pointerDown+" "))return h=e.target,k=l.jquery.split("."),void("1"===k[0]&&k[1]<4&&e.preventDefault());if(h=null,/(input|select|button|textarea)/i.test(e.target.nodeName)||l.hasClass(i.cssNoSort)||l.parents("."+i.cssNoSort).length>0||l.parents("button").length>0)return!i.cancelSelection;i.delayInit&&d(i.cache)&&g(b),j=a.fn.closest?a(this).closest("th, td")[0]:/TH|TD/.test(this.nodeName)?this:a(this).parents("th, td")[0],j=i.$headers[c.index(j)],j.sortDisabled||p(b,j,e)}}),i.cancelSelection&&c.attr("unselectable","on").bind("selectstart",!1).css({"user-select":"none",MozUserSelect:"none"})},u.restoreHeaders=function(b){var c,d,e=a(b)[0].config,f=e.$table.find(e.selectorHeaders),g=f.length;for(c=0;g>c;c++)d=f.eq(c),d.find("."+u.css.headerIn).length&&d.html(e.headerContent[c])},u.destroy=function(b,c,d){if(b=a(b)[0],b.hasInitialized){u.removeWidget(b,!0,!1);var e,f=a(b),g=b.config,h=f.find("thead:first"),i=h.find("tr."+u.css.headerRow).removeClass(u.css.headerRow+" "+g.cssHeaderRow),j=f.find("tfoot:first > tr").children("th, td");c===!1&&a.inArray("uitheme",g.widgets)>=0&&(f.trigger("applyWidgetId",["uitheme"]),f.trigger("applyWidgetId",["zebra"])),h.find("tr").not(i).remove(),e="sortReset update updateAll updateRows updateCell addRows updateComplete sorton appendCache updateCache "+"applyWidgetId applyWidgets refreshWidgets destroy mouseup mouseleave keypress sortBegin sortEnd resetToLoadState ".split(" ").join(g.namespace+" "),f.removeData("tablesorter").unbind(e.replace(/\s+/g," ")),g.$headers.add(j).removeClass([u.css.header,g.cssHeader,g.cssAsc,g.cssDesc,u.css.sortAsc,u.css.sortDesc,u.css.sortNone].join(" ")).removeAttr("data-column").removeAttr("aria-label").attr("aria-disabled","true"),i.find(g.selectorSort).unbind("mousedown mouseup keypress ".split(" ").join(g.namespace+" ").replace(/\s+/g," ")),u.restoreHeaders(b),f.toggleClass(u.css.table+" "+g.tableClass+" tablesorter-"+g.theme,c===!1),b.hasInitialized=!1,delete b.config.cache,"function"==typeof d&&d(b)}},u.regex={chunk:/(^([+\-]?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?)?$|^0x[0-9a-f]+$|\d+)/gi,chunks:/(^\\0|\\0$)/,hex:/^0x[0-9a-f]+$/i},u.sortNatural=function(a,b){if(a===b)return 0;var c,d,e,f,g,h,i,j,k=u.regex;if(k.hex.test(b)){if(d=parseInt(a.match(k.hex),16),f=parseInt(b.match(k.hex),16),f>d)return-1;if(d>f)return 1}for(c=a.replace(k.chunk,"\\0$1\\0").replace(k.chunks,"").split("\\0"),e=b.replace(k.chunk,"\\0$1\\0").replace(k.chunks,"").split("\\0"),j=Math.max(c.length,e.length),i=0;j>i;i++){if(g=isNaN(c[i])?c[i]||0:parseFloat(c[i])||0,h=isNaN(e[i])?e[i]||0:parseFloat(e[i])||0,isNaN(g)!==isNaN(h))return isNaN(g)?1:-1;if(typeof g!=typeof h&&(g+="",h+=""),h>g)return-1;if(g>h)return 1}return 0},u.sortNaturalAsc=function(a,b,c,d,e){if(a===b)return 0;var f=e.string[e.empties[c]||e.emptyTo];return""===a&&0!==f?"boolean"==typeof f?f?-1:1:-f||-1:""===b&&0!==f?"boolean"==typeof f?f?1:-1:f||1:u.sortNatural(a,b)},u.sortNaturalDesc=function(a,b,c,d,e){if(a===b)return 0;var f=e.string[e.empties[c]||e.emptyTo];return""===a&&0!==f?"boolean"==typeof f?f?-1:1:f||1:""===b&&0!==f?"boolean"==typeof f?f?1:-1:-f||-1:u.sortNatural(b,a)},u.sortText=function(a,b){return a>b?1:b>a?-1:0},u.getTextValue=function(a,b,c){if(c){var d,e=a?a.length:0,f=c+b;for(d=0;e>d;d++)f+=a.charCodeAt(d);return b*f}return 0},u.sortNumericAsc=function(a,b,c,d,e,f){if(a===b)return 0;var g=f.config,h=g.string[g.empties[e]||g.emptyTo];return""===a&&0!==h?"boolean"==typeof h?h?-1:1:-h||-1:""===b&&0!==h?"boolean"==typeof h?h?1:-1:h||1:(isNaN(a)&&(a=u.getTextValue(a,c,d)),isNaN(b)&&(b=u.getTextValue(b,c,d)),a-b)},u.sortNumericDesc=function(a,b,c,d,e,f){if(a===b)return 0;var g=f.config,h=g.string[g.empties[e]||g.emptyTo];return""===a&&0!==h?"boolean"==typeof h?h?-1:1:h||1:""===b&&0!==h?"boolean"==typeof h?h?1:-1:-h||-1:(isNaN(a)&&(a=u.getTextValue(a,c,d)),isNaN(b)&&(b=u.getTextValue(b,c,d)),b-a)},u.sortNumeric=function(a,b){return a-b},u.characterEquivalents={a:"áàâãäąå",A:"ÁÀÂÃÄĄÅ",c:"çćč",C:"ÇĆČ",e:"éèêëěę",E:"ÉÈÊËĚĘ",i:"íìİîïı",I:"ÍÌİÎÏ",o:"óòôõöō",O:"ÓÒÔÕÖŌ",ss:"ß",SS:"ẞ",u:"úùûüů",U:"ÚÙÛÜŮ"},u.replaceAccents=function(a){var b,c="[",d=u.characterEquivalents;if(!u.characterRegex){u.characterRegexArray={};for(b in d)"string"==typeof b&&(c+=d[b],u.characterRegexArray[b]=new RegExp("["+d[b]+"]","g"));u.characterRegex=new RegExp(c+"]")}if(u.characterRegex.test(a))for(b in d)"string"==typeof b&&(a=a.replace(u.characterRegexArray[b],b));return a},u.isValueInArray=function(a,b){var c,d=b.length;for(c=0;d>c;c++)if(b[c][0]===a)return c;return-1},u.addParser=function(a){var b,c=u.parsers.length,d=!0;for(b=0;c>b;b++)u.parsers[b].id.toLowerCase()===a.id.toLowerCase()&&(d=!1);d&&u.parsers.push(a)},u.addInstanceMethods=function(b){a.extend(u.instanceMethods,b)},u.getParserById=function(a){if("false"==a)return!1;var b,c=u.parsers.length;for(b=0;c>b;b++)if(u.parsers[b].id.toLowerCase()===a.toString().toLowerCase())return u.parsers[b];return!1},u.addWidget=function(a){u.widgets.push(a)},u.hasWidget=function(b,c){return b=a(b),b.length&&b[0].config&&b[0].config.widgetInit[c]||!1},u.getWidgetById=function(a){var b,c,d=u.widgets.length;for(b=0;d>b;b++)if(c=u.widgets[b],c&&c.hasOwnProperty("id")&&c.id.toLowerCase()===a.toLowerCase())return c},u.applyWidgetOptions=function(b,c){var d,e,f=c.widgets.length,g=c.widgetOptions;if(f)for(d=0;f>d;d++)e=u.getWidgetById(c.widgets[d]),e&&"options"in e&&(g=b.config.widgetOptions=a.extend(!0,{},e.options,g))},u.applyWidget=function(b,d,e){b=a(b)[0];var f,g,h,i,j,k,l,m=b.config,n=m.widgetOptions,o=" "+m.table.className+" ",p=[];if(d===!1||!b.hasInitialized||!b.isApplyingWidgets&&!b.isUpdating){if(m.debug&&(i=new Date),l=new RegExp("\\s"+m.widgetClass.replace(/\{name\}/i,"([\\w-]+)")+"\\s","g"),o.match(l)&&(k=o.match(l)))for(g=k.length,f=0;g>f;f++)m.widgets.push(k[f].replace(l,"$1"));if(m.widgets.length){for(b.isApplyingWidgets=!0,m.widgets=a.grep(m.widgets,function(b,c){return a.inArray(b,m.widgets)===c}),h=m.widgets||[],g=h.length,f=0;g>f;f++)l=u.getWidgetById(h[f]),l&&l.id&&(l.priority||(l.priority=10),p[f]=l);for(p.sort(function(a,b){return a.priority<b.priority?-1:a.priority===b.priority?0:1}),g=p.length,f=0;g>f;f++)p[f]&&((d||!m.widgetInit[p[f].id])&&(m.widgetInit[p[f].id]=!0,b.hasInitialized&&u.applyWidgetOptions(b,m),"init"in p[f]&&(m.debug&&(j=new Date),p[f].init(b,p[f],m,n),m.debug&&u.benchmark("Initializing "+p[f].id+" widget",j))),!d&&"format"in p[f]&&(m.debug&&(j=new Date),p[f].format(b,m,n,!1),m.debug&&u.benchmark((d?"Initializing ":"Applying ")+p[f].id+" widget",j)));d||"function"!=typeof e||e(b)}setTimeout(function(){b.isApplyingWidgets=!1,a.data(b,"lastWidgetApplication",new Date)},0),m.debug&&(k=m.widgets.length,c("Completed "+(d===!0?"initializing ":"applying ")+k+" widget"+(1!==k?"s":""),i))}},u.removeWidget=function(c,d,e){c=a(c)[0];var f,g,h,i,j=c.config;if(d===!0)for(d=[],i=u.widgets.length,h=0;i>h;h++)g=u.widgets[h],g&&g.id&&d.push(g.id);else d=(a.isArray(d)?d.join(","):d||"").toLowerCase().split(/[\s,]+/);for(i=d.length,f=0;i>f;f++)g=u.getWidgetById(d[f]),h=a.inArray(d[f],j.widgets),g&&"remove"in g&&(j.debug&&h>=0&&b('Removing "'+d[f]+'" widget'),g.remove(c,j,j.widgetOptions,e),j.widgetInit[d[f]]=!1),h>=0&&e!==!0&&j.widgets.splice(h,1)},u.refreshWidgets=function(b,c,d){b=a(b)[0];var e,f=b.config,g=f.widgets,h=u.widgets,i=h.length,j=[],k=function(b){a(b).trigger("refreshComplete")};for(e=0;i>e;e++)h[e]&&h[e].id&&(c||a.inArray(h[e].id,g)<0)&&j.push(h[e].id);u.removeWidget(b,j.join(","),!0),d!==!0?(u.applyWidget(b,c||!1,k),c&&u.applyWidget(b,!1,k)):k(b)},u.getColumnText=function(b,c,e){b=a(b)[0];var f,g,h,i,j,k,l,m,n,o,p="function"==typeof e,q="all"===c,r={raw:[],parsed:[],$cell:[]},s=b.config;if(!d(s)){for(j=s.$tbodies.length,f=0;j>f;f++)for(h=s.cache[f].normalized,k=h.length,g=0;k>g;g++)o=!0,i=h[g],m=q?i.slice(0,s.columns):i[c],i=i[s.columns],l=q?i.raw:i.raw[c],n=q?i.$row.children():i.$row.children().eq(c),p&&(o=e({tbodyIndex:f,rowIndex:g,parsed:m,raw:l,$row:i.$row,$cell:n})),o!==!1&&(r.parsed.push(m),r.raw.push(l),r.$cell.push(n));return r}},u.getData=function(b,c,d){var e,f,g="",h=a(b);return h.length?(e=a.metadata?h.metadata():!1,f=" "+(h.attr("class")||""),"undefined"!=typeof h.data(d)||"undefined"!=typeof h.data(d.toLowerCase())?g+=h.data(d)||h.data(d.toLowerCase()):e&&"undefined"!=typeof e[d]?g+=e[d]:c&&"undefined"!=typeof c[d]?g+=c[d]:" "!==f&&f.match(" "+d+"-")&&(g=f.match(new RegExp("\\s"+d+"-([\\w-]+)"))[1]||""),a.trim(g)):""},u.formatFloat=function(b,c){if("string"!=typeof b||""===b)return b;var d,e=c&&c.config?c.config.usNumberFormat!==!1:"undefined"!=typeof c?c:!0;return b=e?b.replace(/,/g,""):b.replace(/[\s|\.]/g,"").replace(/,/g,"."),/^\s*\([.\d]+\)/.test(b)&&(b=b.replace(/^\s*\(([.\d]+)\)/,"-$1")),d=parseFloat(b),isNaN(d)?a.trim(b):d},u.isDigit=function(a){return isNaN(a)?/^[\-+(]?\d+[)]?$/.test(a.toString().replace(/[,.'"\s]/g,"")):""!==a}}});var b=a.tablesorter;a.fn.extend({tablesorter:b.construct}),b.addParser({id:"no-parser",is:function(){return!1},format:function(){return""},type:"text"}),b.addParser({id:"text",is:function(){return!0},format:function(c,d){var e=d.config;return c&&(c=a.trim(e.ignoreCase?c.toLocaleLowerCase():c),c=e.sortLocaleCompare?b.replaceAccents(c):c),c},type:"text"}),b.addParser({id:"digit",is:function(a){return b.isDigit(a)},format:function(c,d){var e=b.formatFloat((c||"").replace(/[^\w,. \-()]/g,""),d);return c&&"number"==typeof e?e:c?a.trim(c&&d.config.ignoreCase?c.toLocaleLowerCase():c):c},type:"numeric"}),b.addParser({id:"currency",is:function(a){return/^\(?\d+[\u00a3$\u20ac\u00a4\u00a5\u00a2?.]|[\u00a3$\u20ac\u00a4\u00a5\u00a2?.]\d+\)?$/.test((a||"").replace(/[+\-,. ]/g,""))},format:function(c,d){var e=b.formatFloat((c||"").replace(/[^\w,. \-()]/g,""),d);return c&&"number"==typeof e?e:c?a.trim(c&&d.config.ignoreCase?c.toLocaleLowerCase():c):c},type:"numeric"}),b.addParser({id:"url",is:function(a){return/^(https?|ftp|file):\/\//.test(a)},format:function(b){return b?a.trim(b.replace(/(https?|ftp|file):\/\//,"")):b},parsed:!0,type:"text"}),b.addParser({id:"isoDate",is:function(a){return/^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}/.test(a)},format:function(a,b){var c=a?new Date(a.replace(/-/g,"/")):a;return c instanceof Date&&isFinite(c)?c.getTime():a},type:"numeric"}),b.addParser({id:"percent",is:function(a){return/(\d\s*?%|%\s*?\d)/.test(a)&&a.length<15},format:function(a,c){return a?b.formatFloat(a.replace(/%/g,""),c):a},type:"numeric"}),b.addParser({id:"image",is:function(a,b,c,d){return d.find("img").length>0},format:function(b,c,d){return a(d).find("img").attr(c.config.imgAttr||"alt")||b},parsed:!0,type:"text"}),b.addParser({id:"usLongDate",is:function(a){return/^[A-Z]{3,10}\.?\s+\d{1,2},?\s+(\d{4})(\s+\d{1,2}:\d{2}(:\d{2})?(\s+[AP]M)?)?$/i.test(a)||/^\d{1,2}\s+[A-Z]{3,10}\s+\d{4}/i.test(a);
},format:function(a,b){var c=a?new Date(a.replace(/(\S)([AP]M)$/i,"$1 $2")):a;return c instanceof Date&&isFinite(c)?c.getTime():a},type:"numeric"}),b.addParser({id:"shortDate",is:function(a){return/(^\d{1,2}[\/\s]\d{1,2}[\/\s]\d{4})|(^\d{4}[\/\s]\d{1,2}[\/\s]\d{1,2})/.test((a||"").replace(/\s+/g," ").replace(/[\-.,]/g,"/"))},format:function(a,c,d,e){if(a){var f,g,h=c.config,i=h.$headerIndexed[e],j=i.length&&i[0].dateFormat||b.getData(i,b.getColumnData(c,h.headers,e),"dateFormat")||h.dateFormat;return g=a.replace(/\s+/g," ").replace(/[\-.,]/g,"/"),"mmddyyyy"===j?g=g.replace(/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{4})/,"$3/$1/$2"):"ddmmyyyy"===j?g=g.replace(/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{4})/,"$3/$2/$1"):"yyyymmdd"===j&&(g=g.replace(/(\d{4})[\/\s](\d{1,2})[\/\s](\d{1,2})/,"$1/$2/$3")),f=new Date(g),f instanceof Date&&isFinite(f)?f.getTime():a}return a},type:"numeric"}),b.addParser({id:"time",is:function(a){return/^(([0-2]?\d:[0-5]\d)|([0-1]?\d:[0-5]\d\s?([AP]M)))$/i.test(a)},format:function(a,b){var c=a?new Date("2000/01/01 "+a.replace(/(\S)([AP]M)$/i,"$1 $2")):a;return c instanceof Date&&isFinite(c)?c.getTime():a},type:"numeric"}),b.addParser({id:"metadata",is:function(){return!1},format:function(b,c,d){var e=c.config,f=e.parserMetadataName?e.parserMetadataName:"sortValue";return a(d).metadata()[f]},type:"numeric"}),b.addWidget({id:"zebra",priority:90,format:function(b,c,d){var e,f,g,h,i,j,k,l,m=new RegExp(c.cssChildRow,"i"),n=c.$tbodies.add(a(c.namespace+"_extra_table").children("tbody:not(."+c.cssInfoBlock+")"));for(c.debug&&(i=new Date),j=0;j<n.length;j++)for(g=0,e=n.eq(j).children("tr:visible").not(c.selectorRemove),l=e.length,k=0;l>k;k++)f=e.eq(k),m.test(f[0].className)||g++,h=g%2===0,f.removeClass(d.zebra[h?1:0]).addClass(d.zebra[h?0:1])},remove:function(a,c,d,e){if(!e){var f,g,h=c.$tbodies,i=(d.zebra||["even","odd"]).join(" ");for(f=0;f<h.length;f++)g=b.processTbody(a,h.eq(f),!0),g.children().removeClass(i),b.processTbody(a,g,!1)}}})}(jQuery),a.tablesorter});
</script>

</body>
</html>