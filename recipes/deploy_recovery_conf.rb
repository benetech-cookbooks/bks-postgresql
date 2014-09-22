cookbook_file "recovery_basebackup.conf" do
  path "/etc/postgresql/9.2/main/recovery_basebackup.conf"
  action :create
end