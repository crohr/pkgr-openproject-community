#-- copyright
# OpenProject My Project Page Plugin
#
# Copyright (C) 2011-2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.md for more details.
#++

require File.dirname(__FILE__) + '/../spec_helper'

describe MyProjectsOverview do
  before do
    @enabled_module_names = %w[activity work_package_tracking news wiki]
    FactoryGirl.create(:project, :enabled_module_names => @enabled_module_names)
    @project = Project.find(:first)
    @overview = MyProjectsOverview.create(:project_id => @project.id)
  end

  it 'sets default elements for new records if no elements are provided' do
    o = MyProjectsOverview.new
    o.left.should =~ ["project_description", "project_details", "work_package_tracking"]
    o.right.should =~ ["members", "news_latest"]
    o.top.should =~ []
    o.hidden.should =~ []
  end

  it 'does not set default elements if elements are provided' do
    o = MyProjectsOverview.new :left => ["members"]
    o.left.should =~ ["members"]
    o.right.should =~ ["members", "news_latest"]
    o.top.should =~ []
    o.hidden.should =~ []
  end


  it 'does not enforce default elements' do
    @overview.right = []
    @overview.save!

    @overview.reload
    @overview.right.should =~ []
  end

  it 'creates a new custom element' do
    @overview.new_custom_element.should_not be_nil
  end

  it "creates a new custom element as [idx, title, text]" do
    ce = @overview.new_custom_element
    ce[0].should == "a"
    ce[1].should be_kind_of String
    ce[2].should =~ /^h3\./
  end

  it "can save a custom element" do
    @overview.hidden << @overview.new_custom_element
    ce = @overview.custom_elements.last
    @overview.save_custom_element(ce[0], "Title", "Content").should be true
    ce[1].should == "Title"
    ce[2].should == "Content"
  end

  it "should always show attachments" do
    @overview.attachments_visible?(nil).should be true
  end
end
