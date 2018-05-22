package Binance::Constants;

# MIT License
#
# Copyright (c) 2017 Lari Taskula  <lari@taskula.fi>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

use strict;
use warnings;

my %constants;
BEGIN {
    %constants = (
        BASE_URL => $ENV{BINANCE_API_BASE_URL} || 'https://api.binance.com',
        WSS_URL  => $ENV{BINANCE_WSS_BASE_URL} || 'wss://stream.binance.com:9443/ws/',
        DEBUG    => $ENV{BINANCE_API_DEBUG}    || 0,
    );
}

use constant \%constants;

use base 'Exporter';

our @EXPORT      = ();
our @EXPORT_OK   = keys(%constants);
our %EXPORT_TAGS = (
   all     => \@EXPORT_OK,
   default => \@EXPORT,
);

1;
