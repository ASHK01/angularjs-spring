<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>AngularJS Spring MVC Example</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value='/assets/css/app.css' />" rel="stylesheet"></link>
</head>
<body ng-app="myCrudApp" class="ng-cloak">
      <div class="generic-container" ng-controller="ProductController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Create new bug</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.product.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="name">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.product.name" id="name" class="field form-control input-sm" placeholder="Enter product name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="name">Location</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.product.location" id="name" class="field form-control input-sm" placeholder="Enter location" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>                         
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="name">Status</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.product.status" id="name" class="field form-control input-sm" placeholder="Enter Status" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="name">Type</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.product.type" id="name" class="field form-control input-sm" placeholder="Enter Type" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      <!-- <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="price">Price</label>
                              <div class="col-md-7">
                                  <input type="number" ng-model="ctrl.product.price" id="price" min="1" class="field form-control input-sm" placeholder="Enter product price"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.price.$error.required">This is a required field</span>
                                      <span ng-show="myForm.price.$error.number">Not a valid number</span>
                                  </div>
                              </div>
                          </div>
                      </div> -->
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.product.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Bugs</span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Bug ID</th>
                              <th>Name</th>
                              <th>Location</th>
                              <th>Status</th>
                              <th>Type</th>
                              <th>Price</th>
                              <th width="25%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="p in ctrl.products">
                              <td><span ng-bind="p.id"></span></td>
                              <td><span ng-bind="p.name"></span></td>
                              <td><span ng-bind="p.location"></span></td>
                              <td><span ng-bind="p.status"></span></td>
                              <td><span ng-bind="p.type"></span></td>
                              <td><span ng-bind="p.price"></span></td>
                              <td>
                              	<button type="button" ng-click="ctrl.edit(p.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(p.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.js"></script>
	<script src="<c:url value='/assets/js/app.js' />"></script>
	<script src="<c:url value='/assets/js/productService.js' />"></script>
	<script src="<c:url value='/assets/js/productController.js' />"></script>
</body>
</html>
