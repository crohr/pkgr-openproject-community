#-- copyright
# OpenProject Costs Plugin
#
# Copyright (C) 2009 - 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#++

require 'spec_helper'

describe CostlogController do
  describe "routing" do
    it { get('/work_packages/5/cost_entries').should route_to(:controller => 'costlog',
                                                              :action => 'index',
                                                              :work_package_id => '5') }

    it { get('/projects/blubs/cost_entries/new').should route_to(:controller => 'costlog',
                                                                 :action => 'new',
                                                                 :project_id => 'blubs') }

    it { post('/projects/blubs/cost_entries').should route_to(:controller => 'costlog',
                                                              :action => 'create',
                                                              :project_id => 'blubs') }

    it { get('/work_packages/5/cost_entries/new').should route_to(:controller => 'costlog',
                                                                  :action => 'new',
                                                                  :work_package_id => '5') }

    it { get('/cost_entries/5/edit').should route_to(:controller => 'costlog',
                                                     :action => 'edit',
                                                     :id => '5') }

    it { put('/cost_entries/5').should route_to(:controller => 'costlog',
                                                :action => 'update',
                                                :id => '5') }

    it { delete('/cost_entries/5').should route_to(:controller => 'costlog',
                                                   :action => 'destroy',
                                                   :id => '5') }
  end
end
