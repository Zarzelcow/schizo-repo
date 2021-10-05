# Save this file as "application.profile" (change "application" with the
# program name) in ~/.config/firejail directory. Firejail will find it
# automatically every time you sandbox your application.
#
# Run "firejail application" to test it. In the file there are
# some other commands you can try. Enable them by removing the "#".

# Firejail profile for osu-stable
# Persistent local customizations
#include osu-stable.local
# Persistent global definitions
#include globals.local

### BLACKLISTS
include disable-common.inc	# dangerous directories like ~/.ssh and ~/.gnupg
include disable-devel.inc	# development tools such as gcc and gdb
#include disable-exec.inc	# non-executable directories such as /var, /tmp, and /home
include disable-interpreters.inc	# perl, python, lua etc.
include disable-passwdmgr.inc	# password managers
include disable-programs.inc	# user configuration for programs such as firefox, vlc etc.
#include disable-shell.inc	# sh, bash, zsh etc.
include disable-xdg.inc	# standard user directories: Documents, Pictures, Videos, Music
noexec /tmp
noexec ${RUNUSER}

### WHITELIST
whitelist ${HOME}/.local/share/osu-stable
whitelist ${HOME}/.local/share/wineprefixes/osu-stable
#include whitelist-common.inc
#whitelist /usr/share/osu
#include whitelist-usr-share-common.inc
#include whitelist-var-common.inc

apparmor	# if you have AppArmor running, try this one!
ipc-namespace
nodvd	# disable DVD and CD devices
nogroups	# disable supplementary user groups
nonewprivs
noroot
notv	# disable DVB TV devices
nou2f	# disable U2F devices
#protocol unix,inet,inet6,
netfilter
seccomp
### If you install strace on your system, Firejail will also create a
### whitelisted seccomp filter.
#shell none
#tracelog
#ignore net

disable-mnt	# no access to /mnt, /media, /run/mount and /run/media
#private-dev
private-etc login.defs,ssl,passwd,groups,group,hosts
private-tmp
