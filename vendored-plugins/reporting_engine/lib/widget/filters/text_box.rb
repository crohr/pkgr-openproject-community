#-- copyright
# ReportingEngine
#
# Copyright (C) 2010 - 2014 the OpenProject Foundation (OPF)
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

#make sure to require Widget::Filters::Base first because otherwise
#ruby might find Base within Widget and Rails will not load it
require_dependency 'widget/filters/base'
class Widget::Filters::TextBox < Widget::Filters::Base
  def render
    write(content_tag(:td) do

      label = content_tag :label,
                          h(l(filter_class.underscore_name)) + " " + l(:label_filter_value),
                          :for => "#{filter_class.underscore_name}_arg_1_val",
                          :class => 'hidden-for-sighted'

      content_tag :div, :id => "#{filter_class.underscore_name}_arg_1", :class => "filter_values" do
        label + text_field_tag("values[#{filter_class.underscore_name}]", "",
            :size => "6",
            :class => "select-small",
            :id => "#{filter_class.underscore_name}_arg_1_val",
            :'data-filter-name' => filter_class.underscore_name)
      end
    end)
  end
end
