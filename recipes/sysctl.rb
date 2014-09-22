#
# set reasonable sysctl params for postgres using logic from chapter 5 of Postgres 9 High Performance
#

include_recipe 'sysctl::apply'

page_size=`getconf PAGE_SIZE`.to_i
phys_pages=`getconf _PHYS_PAGES`.to_i

shmall=phys_pages/2
shmmax=shmall*page_size

sysctl_param 'kernel.shmall' do
  value shmall
end

sysctl_param 'kernel.shmmax' do
  value shmmax
end