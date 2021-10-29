ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        # span I18n.t("active_admin.dashboard_welcome.welcome")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
        span I18n.t 'mes_text.dashboard_custum_text'
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
      column do
        panel "Recent users" do
          ul do
            User.limit(5).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
          end
        end
      end



    end
    columns do
      column do
        panel "Recent hospitals" do
          ul do
            Hospital.limit(5).map do |hospital|
              li link_to(hospital.name, admin_hospital_path(hospital))
            end
          end
        end
      end

      column do
        panel "Recent blood banks" do
          ul do
            BloodBank.limit(5).map do |blood_bank|
              li link_to(blood_bank.name, admin_blood_bank_path(blood_bank))
            end
          end
        end
      end

      column do
        panel "Recent pharmacies" do
          ul do
            Pharmacy.limit(5).map do |pharmacy|
              li link_to(pharmacy.name, admin_pharmacy_path(pharmacy))
            end
          end
        end
      end



    end
  end # content
end
