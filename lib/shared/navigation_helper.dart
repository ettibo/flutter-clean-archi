import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

void pushTo(
        {required PageRouteInfo routeInfo,
        required BuildContext context,
        StackRouter? router}) =>
    router != null ? router.push(routeInfo) : context.router.push(routeInfo);

void navigateTo(
        {required PageRouteInfo routeInfo,
        required BuildContext context,
        StackRouter? router}) =>
    router != null
        ? router.navigate(routeInfo)
        : context.router.navigate(routeInfo);

void replace(
        {required PageRouteInfo routeInfo,
        required BuildContext context,
        StackRouter? router}) =>
    router != null
        ? router.replace(routeInfo)
        : context.router.replace(routeInfo);

void pop({required BuildContext context, StackRouter? router}) =>
    router != null ? router.pop() : context.router.pop();
