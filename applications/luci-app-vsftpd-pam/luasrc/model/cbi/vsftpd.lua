-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2008 Jo-Philipp Wich <jow@openwrt.org>
-- Copyright 2018 cmheia <cmheia@gmail.com>
-- Licensed to the public under the Apache License 2.0.

m = Map("vsftpd", translate("vsftpd FTP Server"))

s = m:section(TypedSection, "vsftpd",
	translate("Probably the most secure and fastest FTP server for UNIX-like systems."))
s.anonymous=true

s:tab("general",
	translate("General Settings"))
s:tab("vuser",
	translate("Virtual User"))
s:tab("anonymous",
	translate("Anonymous User"))
s:tab("log",
	translate("Log"))
s:tab("template",
	translate("User Template"))

s:taboption("general", Flag, "enable4",
	translate("Enable IPv4"))
s:taboption("general", Value, "listen_addr4",
	translate("Bind IPv4 address"),
	translate("Numeric IP address"))
s:taboption("general", Flag, "enable6",
	translate("Enable IPv6"))
s:taboption("general", Value, "listen_addr6",
	translate("Bind IPv6 address"),
	translate("Standard IPv6 address format"))
s:taboption("general", Value, "listen_port",
	translate("Listen port"))
s:taboption("general", Value, "ftp_data_port",
	translate("ftp_data_port"),
	translate("The port from which PORT style connections originate (as long as the poorly named connect_from_port_20 is enabled)."))
s:taboption("general", Value, "banner",
	translate("Banner"),
	translate("Greeting banner displayed by vsftpd when a connection first comes in."))
s:taboption("general", Flag, "write_enable",
	translate("write_enable"),
	translate("This controls whether any FTP commands which change the filesystem are allowed or not. These commands are: STOR, DELE, RNFR, RNTO, MKD, RMD, APPE and SITE."))
s:taboption("general", Flag, "download_enable",
	translate("download_enable"),
	translate("If deactivated, all download requests will give permission denied."))
s:taboption("general", Flag, "force_dot_files",
	translate("force_dot_files"),
	translate("If activated, files and directories starting with . will be shown in directory listings even if the \"a\" flag was not used by the client. This override excludes the \".\" and \"..\" entries."))
s:taboption("general", Value, "local_umask",
	translate("local_umask"),
	translate("The value that the umask for file creation is set to for local users. NOTE! If you want to specify octal values, remember the \"0\" prefix otherwise the value will be treated as a base 10 integer!"))
s:taboption("general", Flag, "dirlist_enable",
	translate("dirlist_enable"),
	translate("If deactivated, all directory list commands will give permission denied."))
s:taboption("general", Flag, "dirmessage_enable",
	translate("dirmessage_enable"),
	translate("If activated, users of the FTP server can be shown messages when they first enter a new directory. By default, a directory is scanned for the file .message, but that may be overridden with the configuration setting message_file."))
s:taboption("general", Value, "message_file",
	translate("message_file"),
	translate("This option is the name of the file we look for when a new directory is entered. The contents are displayed to the remote user. This option is only relevant if the option dirmessage_enable is enabled."))
s:taboption("general", Flag, "port_enable",
	translate("port_enable"),
	translate("Set to NO if you want to disallow the PORT method of obtaining a data connection."))
s:taboption("general", Flag, "pasv_enable",
	translate("pasv_enable"),
	translate("Set to NO if you want to disallow the PASV method of obtaining a data connection."))
ascii = s:taboption("general", ListValue, "ascii",
	translate("ASCII mode"),
	translate("Honour ASCII mode data transfers."))
ascii:value("both",
	translate("Both download & upload"))
ascii:value("download",
	translate("Download only"))
ascii:value("upload",
	translate("Upload only"))
s:taboption("general", Value, "idle_session_timeout",
	translate("idle_session_timeout"),
	translate("The timeout, in seconds, which is the maximum time a remote client may spend between FTP commands. If the timeout triggers, the remote client is kicked off."))
s:taboption("general", Value, "connect_timeout",
	translate("connect_timeout"),
	translate("The timeout, in seconds, for a remote client to respond to our PORT style data connection."))
s:taboption("general", Value, "data_connection_timeout",
	translate("data_connection_timeout"),
	translate("The timeout, in seconds, which is roughly the maximum time we permit data transfers to stall for with no progress. If the timeout triggers, the remote client is kicked off."))
s:taboption("general", Value, "max_clients",
	translate("max_clients"),
	translate("If vsftpd is in standalone mode, this is the maximum number of clients which may be connected. Any additional clients connecting will get an error message."))
s:taboption("general", Value, "max_per_ip",
	translate("max_per_ip"),
	translate("If vsftpd is in standalone mode, this is the maximum number of clients which may be connected from the same source internet address. A client will get an error message if they go over this limit."))
s:taboption("general", Value, "local_max_rate",
	translate("local_max_rate"),
	translate("The maximum data transfer rate permitted, in bytes per second, for local authenticated users."))
s:taboption("general", Value, "max_login_fails",
	translate("max_login_fails"),
	translate("After this many login failures, the session is killed."))

s:taboption("vuser", Flag, "vuser_enable",
	translate("Enable Virtual User"))
s:taboption("vuser", Value, "guest_username",
	translate("Owner User"),
	translate("The real username which virtual users are mapped to."))

s:taboption("anonymous", Flag, "anon_enable",
	translate("Enable Anonymous User"),
	translate("Controls whether anonymous logins are permitted or not. If enabled, both the usernames ftp and anonymous are recognised as anonymous logins."))
s:taboption("anonymous", Value, "anon_username",
	translate("Host User"))
s:taboption("anonymous", Value, "anon_usergroup",
	translate("Host User Group"))
s:taboption("anonymous", Value, "anon_userhome",
	translate("Host User Home"))
s:taboption("anonymous", Value, "anon_root",
	translate("FTP root dir"),
	translate("Represents a directory which vsftpd will try to change into after an anonymous login. Failure is silently ignored."))
s:taboption("anonymous", Value, "anon_umask",
	translate("anon_umask"),
	translate("The value that the umask for file creation is set to for anonymous users. NOTE! If you want to specify octal values, remember the \"0\" prefix otherwise the value will be treated as a base 10 integer!"))
s:taboption("anonymous", Flag, "anon_mkdir_write_enable",
	translate("anon_mkdir_write_enable"),
	translate("If activated, anonymous users will be permitted to create new directories under certain conditions. For this to work, the option write_enable must be activated."))
s:taboption("anonymous", Flag, "anon_other_write_enable",
	translate("anon_other_write_enable"),
	translate("If activated, anonymous users will be permitted to perform write operations other than upload and create directory, such as deletion and renaming. This is generally not recommended but included for completeness."))
s:taboption("anonymous", Flag, "anon_upload_enable",
	translate("anon_upload_enable"),
	translate("If activated, anonymous users will be permitted to upload files under certain conditions. For this to work, the option write_enable must be activated, and the anonymous ftp user must have write permission on desired upload locations. This setting is also required for virtual users to upload; by default, virtual users are treated with anonymous (i.e. maximally restricted) privilege."))
s:taboption("anonymous", Value, "anon_max_rate",
	translate("anon_max_rate"),
	translate("The maximum data transfer rate permitted, in bytes per second, for anonymous clients."))

s:taboption("log", Flag, "xferlog_enable",
	translate("xferlog_enable"),
	translate("If enabled, a log file will be maintained detailling uploads and downloads. By default, this file will be placed at /var/log/vsftpd.log"))
s:taboption("log", Flag, "syslog_enable",
	translate("output to system log"),
	translate("If enabled, then any log output which would have gone to /var/log/vsftpd.log goes to the system log instead. Logging is done under the FTPD facility."))
s:taboption("log", Value, "xferlog_file",
	translate("xfer log file"),
	translate("The name of the file to which we write the wu-ftpd style transfer log. The transfer log is only written if the option xferlog_enable is set, along with xferlog_std_format."))
s:taboption("log", Value, "vsftpd_log_file",
	translate("vsftpd_log_file"),
	translate("The name of the file to which we write the vsftpd style log file."))
s:taboption("log", Flag, "xferlog_std_format",
	translate("xferlog_std_format"),
	translate("If enabled, the transfer log file will be written in standard xferlog format, as used by wu-ftpd."))

s:taboption("template", Flag, "user_config_enable",
	translate("Enable User Template"),
	translate("Values in other tabs will be displaced by content in here."))

tmpl = s:taboption("template", Value, "_tmpl",
	translate("Edit the template that is used for generating the vsftpd configuration."),
	translate("This is the content of the file '/etc/vsftpd/vsftpd.conf.user' from which your vsftpd configuration will be generated."))
tmpl.template = "cbi/tvalue"
tmpl.rows = 20

function tmpl.cfgvalue(self, section)
	return nixio.fs.readfile("/etc/vsftpd/vsftpd.conf.user")
end

function tmpl.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	if ("\n" ~= string.sub(value, -1))
	then
		value = value .. "\n"
	end
	nixio.fs.writefile("/etc/vsftpd/vsftpd.conf.user", value)
end

s = m:section(TypedSection, "user",
	translate("Virtual User"))
s.anonymous=true
s.addremove=true
s.template="cbi/tblsection"

s:option(Flag, "enable",
	translate("Enable")).rmempty=false
s:option(Value, "name",
	translate("Username"))
s:option(Value, "pwd",
	translate("Password"))
s:option(Value, "home",
	translate("Home"),
	translate("A directory which vsftpd will try to change into after a local (i.e. non-anonymous) login."))
s:option(Value, "umask",
	translate("umask"),
	translate("Mask for new files"))
s:option(Value, "maxrate",
	translate("Maxrate"),
	translate("The maximum data transfer rate permitted, in bytes per second."))
s:option(Flag, "write",
	translate("Write"))
s:option(Flag, "upload",
	translate("Upload"))
s:option(Value, "owner",
	translate("Owner User"))

return m
