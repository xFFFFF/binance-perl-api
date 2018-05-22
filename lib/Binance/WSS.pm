package Binance::WSS;

# MIT License
#
# Copyright (c) 2018
# Lari Taskula  <lari@taskula.fi>
# Filip La Gre <tutenhamond@gmail.com>
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

use Carp;
use Scalar::Util qw( blessed );

use Binance::API::Logger;
use Binance::API::Request;

use Binance::Exception::Parameter::Required;

our $VERSION = '1.00';

sub wss_aggTrade {
  my ($self, %params) = @;
  my @required = ('symbol');
  unless (defined ($params{$param})) {
    $self->log->error('Parameter "'.$param.'" required');
    Binance::Exception::Parameter::Required->throw(error => 'Parameter "'.$param.'" required',
    parameters => [$param]
    );
  }
  my $stream = {
    symbol => $params{'symbol'},
  };
  return $self->ua->wss( 'aggTrade', { stream => $stream } );
}

sub wss_trade {
  my ($self, %params) = @;
  my @required = ('symbol');
  unless (defined ($params{$param})) {
    $self->log->error('Parameter "'.$param.'" required');
    Binance::Exception::Parameter::Required->throw(error => 'Parameter "'.$param.'" required',
    parameters => [$param]
    );
  }
  my $stream = {
    symbol => $params{'symbol'},
  };
  return $self->ua->wss( '@trade', { stream => $stream } );
}

sub wss_kline {
  my ($self, %params) = @;
  my @required = ('symbol', 'interval');
  foreach my $param (@required) {
    unless (defined ($params{$param})) {
      $self->log->error('Parameter "'.$param.'" required');
      Binance::Exception::Parameter::Required->throw(error => 'Parameter "'.$param.'" required',
      parameters => [$param]
      );
    }
  }
  my $stream = {
    symbol => $params{'symbol'},
    interval => $params{'interval'},
  };
  return $self->ua->wss( '@kline_', { stream => $stream } );
}

sub wss_ticker {
  my ($self, %params) = @;
  my @required = ('symbol');
  unless (defined ($params{$param})) {
    $self->log->error('Parameter "'.$param.'" required');
    Binance::Exception::Parameter::Required->throw(error => 'Parameter "'.$param.'" required',
    parameters => [$param]
    );
  }
  my $stream = {
    symbol => $params{'symbol'},
  };
  return $self->ua->wss( '@ticker', { stream => $stream } );
}

sub  wss_tickerarr {
  return $self->ua->wss(!ticker@arr);
}

sub  wss_depth {
  my ($self, %params) = @;
  my @required = ('symbol');
    foreach my $param (@required) {
    unless (defined ($params{$param})) {
      $self->log->error('Parameter "'.$param.'" required');
      Binance::Exception::Parameter::Required->throw(error => 'Parameter "'.$param.'" required',
      parameters => [$param]
      );
    }
  }
  my $stream = {
    symbol => $params{'symbol'},
    level => $params{'level'},
  };
  return $self->ua->wss( '@depth', { stream => $stream } );
}
