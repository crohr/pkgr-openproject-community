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

require 'roar/decorator'
require 'roar/representer/json/hal'

module API
  module V3
    module CostTypes
      class CostTypeRepresenter < Roar::Decorator
        include Roar::Representer::JSON::HAL
        include Roar::Representer::Feature::Hypermedia
        include OpenProject::StaticRouting::UrlHelpers

        self.as_strategy = API::Utilities::CamelCasingStrategy.new

        def initialize(model, options = {}, *expand)
          @expand = expand
          @work_package = options[:work_package]

          super(model)
        end

        property :_type, exec_context: :decorator

        property :id, render_nil: true
        property :name, render_nil: true
        property :units, render_nil: true
        property :unit, render_nil: true
        property :unit_plural, render_nil: true

        def _type
          'CostType'
        end
      end
    end
  end
end
