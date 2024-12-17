#!/bin/bash

# Remap caps lock to escape

swaymsg input '*' xkb_options caps:escape
