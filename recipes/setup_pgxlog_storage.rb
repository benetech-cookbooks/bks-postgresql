# access our aws credentials
aws = data_bag_item("aws", "main")

bookshare_ebs_btrfs "/var/lib/postgresql/9.2/main/pg_xlog" do
  aws_access_key aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  ebs_volume_type "gp2"
  number_of_volumes 2
  size_of_volumes 50
  raid_type "raid0"
  volume_label "pgxlog"
  mount_point_owner "postgres"
  mount_point_group "postgres"
  mount_point_perms 00700
  mv_mnt_mv_rm true
  start_stop_service "postgresql"
end