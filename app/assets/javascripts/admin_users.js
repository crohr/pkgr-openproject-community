//-- copyright
// OpenProject is a project management system.
// Copyright (C) 2012-2014 the OpenProject Foundation (OPF)
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License version 3.
//
// OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
// Copyright (C) 2006-2013 Jean-Philippe Lang
// Copyright (C) 2010-2013 the ChiliProject Team
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//
// See doc/COPYRIGHT.rdoc for more details.
//++


(function() {
  // When 'assign random password' field is enabled,
  // disable and clear password fields and disable and check the
  // 'force password reset' field
  function on_assign_random_password_change(){
    var checked = jQuery('#user_assign_random_password').is(':checked');
    jQuery('#user_password').prop('disabled', checked);
    jQuery('#user_password_confirmation').prop('disabled', checked);
    jQuery('#user_password').val('');
    jQuery('#user_password_confirmation').val('');
    jQuery('#user_force_password_change').prop('checked', checked)
                                         .prop('disabled', checked);
  }

  // Hide password fields when non-internal authentication source is selected
  function on_auth_source_change() {
    if (this.value === '') {
      jQuery('#password_fields').show();
    } else {
      jQuery('#password_fields').hide();
    }
  }

  jQuery(function init(){
    jQuery('#user_assign_random_password').change(on_assign_random_password_change);
    jQuery('#user_auth_source_id').change(on_auth_source_change);
  });
})();
