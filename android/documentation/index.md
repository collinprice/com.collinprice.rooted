# Appcelerator Titanium Rooted Module

This module provides a function to check if a device has been Jailbroken (iOS), or Rooted (Android). Check the Releases tab for downloads.

## Install

Please check the Appcelerator [documentation](http://docs.appcelerator.com/platform/latest/#!/guide/Using_a_Module) for instructions on how to install this module

## Usage

    var Rooted = require('com.collinprice.rooted');
    if (Rooted.isRooted()) {
        Ti.API.info("DEVICE IS ROOTED!!!");
    } else {
        Ti.API.info("DEVICE IS NOT ROOTED.....");
    }
