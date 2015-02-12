#-- copyright
# OpenProject Reporting Plugin
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

class Widget::CostTypes < Widget::Base
  def render_with_options(options, &block)
    @cost_types = options.delete(:cost_types)
    @selected_type_id = options.delete(:selected_type_id)

    super(options, &block)
  end

  def render
    write contents
  end

  def contents
    content_tag :div do
      available_cost_type_tabs(@subject).map do |id, label|
        type_selection = radio_button_tag("unit", id, id == @selected_type_id)
        type_selection += label_tag "unit_#{id}", h(label)
        type_selection
      end.join("<br />").html_safe
    end
  end
end
