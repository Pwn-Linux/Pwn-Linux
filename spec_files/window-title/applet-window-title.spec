%global _basename plasma6-window-title-applet
%global debug_package %{nil}

%global forgeurl https://github.com/dhruv8sh/%{_basename}
%global commit 6d6b939bb8138a8b1640cf2f6d395a3030d7bbaa
%global date 20240411
%forgemeta

%global applet_id org.kde.windowtitle

Name:           applet-window-title
Version:        0.5
Release:        1%{?dist}
Summary:        Plasma 6 applet that shows the application title and icon for active window
License:        GPL-2.0-or-later

URL:            %{forgeurl}
Source:         %{forgesource}

BuildArch:      noarch
BuildRequires:  desktop-file-utils
Requires:       plasma-workspace

%description
This is a Plasma 6 applet that shows the current window title and icon in your
panels. This plasmoid is coming from Latte land but it can also support Plasma
panels.

%files
%license LICENSE
%doc README.md
%{_datadir}/plasma/plasmoids/%{applet_id}

%prep
%forgeautosetup

%build
#nothing

%install
mkdir -p %{buildroot}%{_datadir}/plasma/plasmoids/%{applet_id}/
cp -r contents %{buildroot}%{_datadir}/plasma/plasmoids/%{applet_id}/

%changelog
* Wed Jun 19 2024 Dipta Biswas <dabiswas112@gmail.com> - 0.9.6-1
- initial package
