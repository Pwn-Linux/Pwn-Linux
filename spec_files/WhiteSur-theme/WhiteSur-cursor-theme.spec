%global hash 5c94e8c
%global date 20220617
%define debug_package %{nil}
%define __os_install_post %{nil}

Name: WhiteSur-cursor-theme
Summary: WhiteSur cursor Theme

Version: %{date}
License: GPLv3
Release: %{?hash:0.1.git%{hash}}%{!?hash:1}%{?dist}
URL:     https://github.com/vinceliuice/WhiteSur-icon-theme
Source0: %{name}-%{date}%{?hash:.git%{hash}}.tar.%{?hash:xz}%{!?hash:gz}

BuildArch: noarch
BuildRequires: coreutils

%description
WhiteSur cursor theme

%prep
%autosetup -n %{name}-%{date}%{?hash:.git%{hash}}

%build

%install
DEST=%{buildroot}%{_datadir}/icons
mkdir -p ${DEST}
cp -r dist ${DEST}/WhiteSur-cursor

%files
%{_datadir}/icons/WhiteSur-cursor

%changelog
* Sat Oct 08 2022 Tomas Chang <changyp6@gmail.com> - 20220617-0.1.git5c94e8c
- Initial build

