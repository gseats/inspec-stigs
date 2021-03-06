# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2015-05-26
# description: The Red Hat Enterprise Linux 6 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems.  Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil.
# impacts

title 'V-38520 - The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.'

control 'V-38520' do
  impact 0.5
  title 'The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.'
  desc '
A log server (loghost) receives syslog messages from one or more systems. This data can be used as an additional log source in the event a system is compromised and its local logs are suspect. Forwarding log messages to a remote loghost also provides system administrators with a centralized place to view the status of multiple hosts within the enterprise.
'
  tag 'stig','V-38520','untestable'
  tag severity: 'medium'
  tag checkid: 'C-46078r1_chk'
  tag fixid: 'F-43468r1_fix'
  tag version: 'RHEL-06-000136'
  tag ruleid: 'SV-50321r1_rule'
  tag fixtext: '
To configure rsyslog to send logs to a remote log server, open "/etc/rsyslog.conf" and read and understand the last section of the file, which describes the multiple directives necessary to activate remote logging. Along with these other directives, the system can be configured to forward its logs to a particular log server by adding or correcting one of the following lines, substituting "[loghost.example.com]" appropriately. The choice of protocol depends on the environment of the system; although TCP and RELP provide more reliable message delivery, they may not be supported in all environments.
To use UDP for log message delivery:

*.* @[loghost.example.com]


To use TCP for log message delivery:

*.* @@[loghost.example.com]


To use RELP for log message delivery:

*.* :omrelp:[loghost.example.com]
'
  tag checktext: '
To ensure logs are sent to a remote host, examine the file "/etc/rsyslog.conf". If using UDP, a line similar to the following should be present:

*.* @[loghost.example.com]

If using TCP, a line similar to the following should be present:

*.* @@[loghost.example.com]

If using RELP, a line similar to the following should be present:

*.* :omrelp:[loghost.example.com]


If none of these are present, this is a finding.
'

# START_DESCRIBE V-38520
  # there are too many ways to send logs off machine to effectively test this.
# END_DESCRIBE V-38520

end
