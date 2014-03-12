Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "dynamic_bmsm_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:dynamic_bmsm ) %>"
                    )
