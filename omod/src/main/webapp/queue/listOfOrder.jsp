<%--
 *  Copyright 2013 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Billing module.
 *
 *  Billing module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Billing module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Billing module.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  author: ghanshyam
 *  date: 3-june-2013
 *  issue no: #1632
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<openmrs:require privilege="Test order queue" otherwise="/login.htm" redirect="/module/billing/main.form" />
<%@ include file="../includes/js_css.jsp"%>

<div style="max-height: 50px; max-width: 1800px;">
	<b class="boxHeader">List of Order</b>
</div>
		<!--  Kesavulu loka 25-06-2013, Add Patient Details on the page where Order ID is clicked -->
<div>	
	<table>
		<tr>
			<td>Patient Identifier:</td>
			<td>${patientSearch.identifier}</td>
		</tr>
		<tr>
			<td>Patient Name:</td>
			<td>${patientSearch.givenName}&nbsp;&nbsp;${fn:replace(patientSearch.middleName,',',' ')}&nbsp;&nbsp;
				${patientSearch.familyName}</td>
		</tr>
		<tr>
			<td>Date of Billing :</td>
			<td>${date}</td>
		</tr>
		<tr>
			<td>patient Category:</td>
			<td>${category}</td>
		</tr>
		<tr>
			<td>Gender:</td>
			<td>${gender}</td>
		</tr>
		<tr>
			<td>Age:</td>
			<td>${age}</td>
		</tr>

	</table>
</div>

<br />

	<table id="myTable" class="tablesorter" class="thickbox">
	<thead>
		<tr align="center">
			<th>S.No</th>
			<th>Order Id</th>
			<th>Date</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="listOfOrder" items="${listOfOrders}" varStatus="index">
			<c:choose>
				<c:when test="${index.count mod 2 == 0}">
					<c:set var="klass" value="odd" />
				</c:when>
				<c:otherwise>
					<c:set var="klass" value="even" />
				</c:otherwise>
			</c:choose>
			<tr class="${klass}">
				<td>${index.count}</td>
				<td><a href="procedureinvestigationorder.form?patientId=${patientId}&encounterId=${listOfOrder.encounter.encounterId}&date=${date}">${listOfOrder.encounter.encounterId}</a>
				</td>
				<td><openmrs:formatDate date="${listOfOrder.createdOn}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%@ include file="/WEB-INF/template/footer.jsp"%>