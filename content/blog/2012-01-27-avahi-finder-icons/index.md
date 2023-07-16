---
title: Change the icon of a FreeBSD served AFP server
date: '2012-01-27'
tags: ['FreeBSD', 'AFP', 'icons']
draft: true
summary: 
images: []
---

I found a blogpost describing the setup of the icon:

<a href="http://www.simonwheatley.co.uk/2008/04/06/avahi-finder-icons/">http://www.simonwheatley.co.uk/2008/04/06/avahi-finder-icons/</a>

So create (if not already present) a file:

<span style="font-family: 'courier new', courier;">/usr/local/etc/avahi/services/afp.service</span>

And put e.g. this in it:

<span style="font-family: 'courier new', courier;">&lt;?xml version="1.0" standalone='no'?&gt;&lt;!--*-nxml-*--&gt;</span>
<span style="font-family: 'courier new', courier;"> &lt;!DOCTYPE service-group SYSTEM "avahi-service.dtd"&gt;</span>
<span style="font-family: 'courier new', courier;"> &lt;service-group&gt;</span>
<span style="font-family: 'courier new', courier;">  &lt;name replace-wildcards="yes"&gt;%h&lt;/name&gt;</span>
<span style="font-family: 'courier new', courier;">  &lt;service&gt;</span>
<span style="font-family: 'courier new', courier;">    &lt;type&gt;_afpovertcp._tcp&lt;/type&gt;</span>
<span style="font-family: 'courier new', courier;">    &lt;port&gt;548&lt;/port&gt;</span>
<span style="font-family: 'courier new', courier;">  &lt;/service&gt;</span>
<span style="font-family: 'courier new', courier;">  &lt;service&gt;</span>
<span style="font-family: 'courier new', courier;">    &lt;type&gt;_device-info._tcp&lt;/type&gt;</span>
<span style="font-family: 'courier new', courier;">    &lt;port&gt;0&lt;/port&gt;</span>
<span style="font-family: 'courier new', courier;">    &lt;txt-record&gt;model=<strong>Xserve</strong>&lt;/txt-record&gt;</span>
<span style="font-family: 'courier new', courier;">  &lt;/service&gt;</span>
<span style="font-family: 'courier new', courier;"> &lt;/service-group&gt;</span>

This will display the AFP server as an Xserve :-)

The different model found in the plist  that defines the graphics are:

(/System/Library/CoreServices/CoreTypes.bundle/Contents/Info.plist)

<table style="border-style:solid;border-width:1px">
<tr style="vertical-align:top;border-style:solid;border-width:1px">
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;">Name</span></td>
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;">ID</span></td>
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;">Models</span></td>
<td style="vertical-align:top;border-style:solid;border-width:1px"></td>
</tr>
<tr style="vertical-align:top;border-style:solid;border-width:1px">
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;">PC</span></td>
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;">public.generic-pc</span></td>
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;">Windows Windows2000 WindowsXP Windows2003 WindowsVista Windows2008 Windows7</span></td>
<td style="vertical-align:top;border-style:solid;border-width:1px"><span style="font-size: 12px;"><img src="/img/icons/public.generic-pc.png" alt="" /></span></td>
</tr>
<tr style="valign:top;border-style:solid;border-width:1px">
<td><span style="font-size: 12px;">Mac</span></td>
<td><span style="font-size: 12px;">com.apple.mac</span></td>
<td><span style="font-size: 12px;">Macintosh</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.mac.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Laptop</span></td>
<td><span style="font-size: 12px;">com.apple.mac.laptop</span></td>
<td><span style="font-size: 12px;">Laptop</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-15.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Tower</span></td>
<td><span style="font-size: 12px;">com.apple.mac.tower</span></td>
<td><span style="font-size: 12px;">Tower</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macpro.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">PowerBook</span></td>
<td><span style="font-size: 12px;">com.apple.powerbook</span></td>
<td><span style="font-size: 12px;">PowerBook</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powerbook-g4-titanium.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">PowerBook G4</span></td>
<td><span style="font-size: 12px;">com.apple.powerbook-g4-titanium</span></td>
<td><span style="font-size: 12px;">PowerBook3,2 PowerBook3,3 PowerBook3,4 PowerBook3,5</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powerbook-g4-titanium.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">PowerBook G4</span></td>
<td><span style="font-size: 12px;">com.apple.powerbook-g4-12</span></td>
<td><span style="font-size: 12px;">PowerBook6,1 PowerBook6,2 PowerBook6,4 PowerBook6,8</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powerbook-g4-12.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">PowerBook G4</span></td>
<td><span style="font-size: 12px;">com.apple.powerbook-g4-15</span></td>
<td><span style="font-size: 12px;">PowerBook5,2 PowerBook5,4 PowerBook5,6 PowerBook5,8</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powerbook-g4-15.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">PowerBook G4</span></td>
<td><span style="font-size: 12px;">com.apple.powerbook-g4-17</span></td>
<td><span style="font-size: 12px;">PowerBook5,1 PowerBook5,3 PowerBook5,5 PowerBook5,7 PowerBook5,9</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powerbook-g4-17.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iBook G4</span></td>
<td><span style="font-size: 12px;">com.apple.ibook-g4</span></td>
<td><span style="font-size: 12px;">PowerBook6,3 PowerBook6,5 PowerBook6,7</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ibook-g4-12.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Power Mac</span></td>
<td><span style="font-size: 12px;">com.apple.powermac</span></td>
<td><span style="font-size: 12px;">PowerMac</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powermac-g4-graphite.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Power Mac G4</span></td>
<td><span style="font-size: 12px;">com.apple.powermac-g4-quicksilver</span></td>
<td><span style="font-size: 12px;">PowerMac3,5</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powermac-g4-quicksilver.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Power Mac G4</span></td>
<td><span style="font-size: 12px;">com.apple.powermac-g4-mirrored-drive-doors</span></td>
<td><span style="font-size: 12px;">PowerMac3,6</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powermac-g4-mirrored-drive-doors.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Power Mac G5</span></td>
<td><span style="font-size: 12px;">com.apple.powermac-g5</span></td>
<td><span style="font-size: 12px;">PowerMac7,2 PowerMac7,3 PowerMac9,1 PowerMac11,2 PowerMac11,2,Quad</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.powermac-g5.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Xserve</span></td>
<td><span style="font-size: 12px;">com.apple.xserve</span></td>
<td><span style="font-size: 12px;">RackMac Xserve</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.xserve.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macmini-unibody</span></td>
<td><span style="font-size: 12px;">Macmini4,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macmini-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macmini-unibody-no-optical</span></td>
<td><span style="font-size: 12px;">Macmini Macmini5,1 Macmini5,2 Macmini5,3</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macmini-unibody-no-optical.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">eMac</span></td>
<td><span style="font-size: 12px;">com.apple.emac</span></td>
<td><span style="font-size: 12px;">PowerMac4,4 PowerMac6,4</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.emac.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iMac</span></td>
<td><span style="font-size: 12px;">com.apple.imac</span></td>
<td><span style="font-size: 12px;">iMac</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-unibody-27.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-g4-15</span></td>
<td><span style="font-size: 12px;">PowerMac4,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-g4-15.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-g4-17</span></td>
<td><span style="font-size: 12px;">PowerMac4,5 PowerMac6,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-g4-17.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-g4-20</span></td>
<td><span style="font-size: 12px;">PowerMac6,3</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-g4-20.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iMac G5</span></td>
<td><span style="font-size: 12px;">com.apple.imac-g5</span></td>
<td><span style="font-size: 12px;">PowerMac8,1 PowerMac8,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-g5-17.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-g5-isight</span></td>
<td><span style="font-size: 12px;">PowerMac12,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-iSight-17.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-core-duo</span></td>
<td><span style="font-size: 12px;">iMac4,1 iMac4,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-iSight-24.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-core-2-duo</span></td>
<td><span style="font-size: 12px;">iMac5,1 iMac5,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-iSight-24.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-iSight-24</span></td>
<td><span style="font-size: 12px;">iMac6,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-iSight-24.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-aluminum-20</span></td>
<td><span style="font-size: 12px;">iMac7,1 iMac8,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-aluminum-20.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-aluminum-24</span></td>
<td><span style="font-size: 12px;">iMac9,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-aluminum-24.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-unibody-21</span></td>
<td><span style="font-size: 12px;">iMac11,2 iMac12,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-unibody-21.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.imac-unibody</span></td>
<td><span style="font-size: 12px;">iMac10,1 iMac11,1 iMac11,3 iMac12,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.imac-unibody-27.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">MacBook</span></td>
<td><span style="font-size: 12px;">com.apple.macbook</span></td>
<td><span style="font-size: 12px;">MacBook</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbook-unibody-plastic.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbook-white</span></td>
<td><span style="font-size: 12px;">MacBook1,1 MacBook2,1 MacBook3,1 MacBook4,1 MacBook5,2 MacBook1,1,White MacBook2,1,White MacBook3,1,White MacBook4,1,White</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbook-white.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbook-black</span></td>
<td><span style="font-size: 12px;">MacBook1,1,Black MacBook2,1,Black MacBook3,1,Black MacBook4,1,Black</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbook-black.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbook-unibody</span></td>
<td><span style="font-size: 12px;">MacBook5,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbook-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbook-unibody-plastic</span></td>
<td><span style="font-size: 12px;">MacBook6,1 MacBook7,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbook-unibody-plastic.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookpro-13-unibody</span></td>
<td><span style="font-size: 12px;">MacBookPro5,5 MacBookPro7,1 MacBookPro8,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-13-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">MacBook Pro</span></td>
<td><span style="font-size: 12px;">com.apple.macbookpro</span></td>
<td><span style="font-size: 12px;">MacBookPro</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-15-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookpro-15</span></td>
<td><span style="font-size: 12px;">MacBookPro1,1 MacBookPro2,2 MacBookPro3,1 MacBookPro4,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-15.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookpro-15-unibody</span></td>
<td><span style="font-size: 12px;">MacBookPro5,1 MacBookPro5,3 MacBookPro5,4 MacBookPro8,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-15-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookpro-17-unibody</span></td>
<td><span style="font-size: 12px;">MacBookPro5,2 MacBookPro6,1 MacBookPro8,3</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-17-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookpro-17</span></td>
<td><span style="font-size: 12px;">MacBookPro1,2 MacBookPro2,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookpro-17.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">MacBook Air</span></td>
<td><span style="font-size: 12px;">com.apple.macbookair</span></td>
<td><span style="font-size: 12px;">MacBookAir1,1 MacBookAir2,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookair.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookair-11-unibody</span></td>
<td><span style="font-size: 12px;">MacBookAir3,1 MacBookAir4,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookair-11-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">(null)</span></td>
<td><span style="font-size: 12px;">com.apple.macbookair-13-unibody</span></td>
<td><span style="font-size: 12px;">MacBookAir MacBookAir3,2 MacBookAir4,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macbookair-13-unibody.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Mac Pro</span></td>
<td><span style="font-size: 12px;">com.apple.macpro</span></td>
<td><span style="font-size: 12px;">MacPro MacPro1,1 MacPro2,1 MacPro3,1 MacPro4,1 MacPro5,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.macpro.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Apple TV</span></td>
<td><span style="font-size: 12px;">com.apple.apple-tv</span></td>
<td><span style="font-size: 12px;">AppleTV AppleTV1,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.apple-tv.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPhone</span></td>
<td><span style="font-size: 12px;">com.apple.iphone</span></td>
<td><span style="font-size: 12px;">M68AP iPhone1,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.iphone.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPhone 3G</span></td>
<td><span style="font-size: 12px;">com.apple.iphone-3g</span></td>
<td><span style="font-size: 12px;">N82AP iPhone1,2</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.iphone-3g.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPhone 3GS</span></td>
<td><span style="font-size: 12px;">com.apple.iphone-3gs</span></td>
<td><span style="font-size: 12px;">N88AP iPhone2,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.iphone-3g.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPhone 4</span></td>
<td><span style="font-size: 12px;">com.apple.iphone-4</span></td>
<td><span style="font-size: 12px;">N90AP iPhone iPhone3,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.iphone-4-black.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPod</span></td>
<td><span style="font-size: 12px;">com.apple.ipod</span></td>
<td><span style="font-size: 12px;">iPod</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ipod-touch-4.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPod touch</span></td>
<td><span style="font-size: 12px;">com.apple.ipod-touch</span></td>
<td><span style="font-size: 12px;">N45AP iPod1,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ipod-touch.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPod touch</span></td>
<td><span style="font-size: 12px;">com.apple.ipod-touch-2</span></td>
<td><span style="font-size: 12px;">N72AP iPod2,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ipod-touch-2.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPod touch</span></td>
<td><span style="font-size: 12px;">com.apple.ipod-touch-3</span></td>
<td><span style="font-size: 12px;">N18AP iPod3,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ipod-touch-2.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPod touch</span></td>
<td><span style="font-size: 12px;">com.apple.ipod-touch-4</span></td>
<td><span style="font-size: 12px;">N81AP iPod4,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ipod-touch-4.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">iPad</span></td>
<td><span style="font-size: 12px;">com.apple.ipad</span></td>
<td><span style="font-size: 12px;">K48AP iPad iPad1,1</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.ipad.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">AirPort Express</span></td>
<td><span style="font-size: 12px;">com.apple.airport-express</span></td>
<td><span style="font-size: 12px;">AirPort4 AirPort4,102 AirPort4,107</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.airport-express.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">AirPort Extreme</span></td>
<td><span style="font-size: 12px;">com.apple.airport</span></td>
<td><span style="font-size: 12px;">AirPort AirPort5 AirPort5,104 AirPort5,105 AirPort5,108 AirPort5,114 AirPort5,117</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.airport-extreme.png" alt="" /></span></td>
</tr>
<tr>
<td><span style="font-size: 12px;">Time Capsule</span></td>
<td><span style="font-size: 12px;">com.apple.time-capsule</span></td>
<td><span style="font-size: 12px;">AirPort6 AirPort6,106 TimeCapsule TimeCapsule6 TimeCapsule6,106 TimeCapsule6,109 TimeCapsule6,113 TimeCapsule6,116</span></td>
<td><span style="font-size: 12px;"><img src="/img/icons/com.apple.time-capsule.png" alt="" /></span></td>
</tr>
</table>
ame

