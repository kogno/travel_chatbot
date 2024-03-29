class Country < ActiveRecord::Base
  has_many :cities
  has_many :airports

  def emoji
    emojis = {}
    emojis["AD"] = "\u{1F1E6}\u{1F1E9}"
    emojis["AE"] = "\u{1F1E6}\u{1F1EA}"
    emojis["AF"] = "\u{1F1E6}\u{1F1EB}"
    emojis["AG"] = "\u{1F1E6}\u{1F1EC}"
    emojis["AI"] = "\u{1F1E6}\u{1F1EE}"
    emojis["AL"] = "\u{1F1E6}\u{1F1F1}"
    emojis["AM"] = "\u{1F1E6}\u{1F1F2}"
    emojis["AO"] = "\u{1F1E6}\u{1F1F4}"
    emojis["AQ"] = "\u{1F1E6}\u{1F1F6}"
    emojis["AR"] = "\u{1F1E6}\u{1F1F7}"
    emojis["AS"] = "\u{1F1E6}\u{1F1F8}"
    emojis["AT"] = "\u{1F1E6}\u{1F1F9}"
    emojis["AU"] = "\u{1F1E6}\u{1F1FA}"
    emojis["AW"] = "\u{1F1E6}\u{1F1FC}"
    emojis["AX"] = "\u{1F1E6}\u{1F1FD}"
    emojis["AZ"] = "\u{1F1E6}\u{1F1FF}"
    emojis["BA"] = "\u{1F1E7}\u{1F1E6}"
    emojis["BB"] = "\u{1F1E7}\u{1F1E7}"
    emojis["BD"] = "\u{1F1E7}\u{1F1E9}"
    emojis["BE"] = "\u{1F1E7}\u{1F1EA}"
    emojis["BF"] = "\u{1F1E7}\u{1F1EB}"
    emojis["BG"] = "\u{1F1E7}\u{1F1EC}"
    emojis["BH"] = "\u{1F1E7}\u{1F1ED}"
    emojis["BI"] = "\u{1F1E7}\u{1F1EE}"
    emojis["BJ"] = "\u{1F1E7}\u{1F1EF}"
    emojis["BL"] = "\u{1F1E7}\u{1F1F1}"
    emojis["BM"] = "\u{1F1E7}\u{1F1F2}"
    emojis["BN"] = "\u{1F1E7}\u{1F1F3}"
    emojis["BO"] = "\u{1F1E7}\u{1F1F4}"
    emojis["BQ"] = "\u{1F1E7}\u{1F1F6}"
    emojis["BR"] = "\u{1F1E7}\u{1F1F7}"
    emojis["BS"] = "\u{1F1E7}\u{1F1F8}"
    emojis["BT"] = "\u{1F1E7}\u{1F1F9}"
    emojis["BV"] = "\u{1F1E7}\u{1F1FB}"
    emojis["BW"] = "\u{1F1E7}\u{1F1FC}"
    emojis["BY"] = "\u{1F1E7}\u{1F1FE}"
    emojis["BZ"] = "\u{1F1E7}\u{1F1FF}"
    emojis["CA"] = "\u{1F1E8}\u{1F1E6}"
    emojis["CC"] = "\u{1F1E8}\u{1F1E8}"
    emojis["CD"] = "\u{1F1E8}\u{1F1E9}"
    emojis["CF"] = "\u{1F1E8}\u{1F1EB}"
    emojis["CG"] = "\u{1F1E8}\u{1F1EC}"
    emojis["CH"] = "\u{1F1E8}\u{1F1ED}"
    emojis["CI"] = "\u{1F1E8}\u{1F1EE}"
    emojis["CK"] = "\u{1F1E8}\u{1F1F0}"
    emojis["CL"] = "\u{1F1E8}\u{1F1F1}"
    emojis["CM"] = "\u{1F1E8}\u{1F1F2}"
    emojis["CN"] = "\u{1F1E8}\u{1F1F3}"
    emojis["CO"] = "\u{1F1E8}\u{1F1F4}"
    emojis["CR"] = "\u{1F1E8}\u{1F1F7}"
    emojis["CU"] = "\u{1F1E8}\u{1F1FA}"
    emojis["CV"] = "\u{1F1E8}\u{1F1FB}"
    emojis["CW"] = "\u{1F1E8}\u{1F1FC}"
    emojis["CX"] = "\u{1F1E8}\u{1F1FD}"
    emojis["CY"] = "\u{1F1E8}\u{1F1FE}"
    emojis["CZ"] = "\u{1F1E8}\u{1F1FF}"
    emojis["DE"] = "\u{1F1E9}\u{1F1EA}"
    emojis["DG"] = "\u{1F1E9}\u{1F1EC}"
    emojis["DJ"] = "\u{1F1E9}\u{1F1EF}"
    emojis["DK"] = "\u{1F1E9}\u{1F1F0}"
    emojis["DM"] = "\u{1F1E9}\u{1F1F2}"
    emojis["DO"] = "\u{1F1E9}\u{1F1F4}"
    emojis["DZ"] = "\u{1F1E9}\u{1F1FF}"
    emojis["EC"] = "\u{1F1EA}\u{1F1E8}"
    emojis["EE"] = "\u{1F1EA}\u{1F1EA}"
    emojis["EG"] = "\u{1F1EA}\u{1F1EC}"
    emojis["EH"] = "\u{1F1EA}\u{1F1ED}"
    emojis["ER"] = "\u{1F1EA}\u{1F1F7}"
    emojis["ES"] = "\u{1F1EA}\u{1F1F8}"
    emojis["ET"] = "\u{1F1EA}\u{1F1F9}"
    emojis["FI"] = "\u{1F1EB}\u{1F1EE}"
    emojis["FJ"] = "\u{1F1EB}\u{1F1EF}"
    emojis["FK"] = "\u{1F1EB}\u{1F1F0}"
    emojis["FM"] = "\u{1F1EB}\u{1F1F2}"
    emojis["FO"] = "\u{1F1EB}\u{1F1F4}"
    emojis["FR"] = "\u{1F1EB}\u{1F1F7}"
    emojis["GA"] = "\u{1F1EC}\u{1F1E6}"
    emojis["GB"] = "\u{1F1EC}\u{1F1E7}"
    emojis["GD"] = "\u{1F1EC}\u{1F1E9}"
    emojis["GE"] = "\u{1F1EC}\u{1F1EA}"
    emojis["GF"] = "\u{1F1EC}\u{1F1EB}"
    emojis["GG"] = "\u{1F1EC}\u{1F1EC}"
    emojis["GH"] = "\u{1F1EC}\u{1F1ED}"
    emojis["GI"] = "\u{1F1EC}\u{1F1EE}"
    emojis["GL"] = "\u{1F1EC}\u{1F1F1}"
    emojis["GM"] = "\u{1F1EC}\u{1F1F2}"
    emojis["GN"] = "\u{1F1EC}\u{1F1F3}"
    emojis["GP"] = "\u{1F1EC}\u{1F1F5}"
    emojis["GQ"] = "\u{1F1EC}\u{1F1F6}"
    emojis["GR"] = "\u{1F1EC}\u{1F1F7}"
    emojis["GS"] = "\u{1F1EC}\u{1F1F8}"
    emojis["GT"] = "\u{1F1EC}\u{1F1F9}"
    emojis["GU"] = "\u{1F1EC}\u{1F1FA}"
    emojis["GW"] = "\u{1F1EC}\u{1F1FC}"
    emojis["GY"] = "\u{1F1EC}\u{1F1FE}"
    emojis["HK"] = "\u{1F1ED}\u{1F1F0}"
    emojis["HM"] = "\u{1F1ED}\u{1F1F2}"
    emojis["HN"] = "\u{1F1ED}\u{1F1F3}"
    emojis["HR"] = "\u{1F1ED}\u{1F1F7}"
    emojis["HT"] = "\u{1F1ED}\u{1F1F9}"
    emojis["HU"] = "\u{1F1ED}\u{1F1FA}"
    emojis["ID"] = "\u{1F1EE}\u{1F1E9}"
    emojis["IE"] = "\u{1F1EE}\u{1F1EA}"
    emojis["IL"] = "\u{1F1EE}\u{1F1F1}"
    emojis["IM"] = "\u{1F1EE}\u{1F1F2}"
    emojis["IN"] = "\u{1F1EE}\u{1F1F3}"
    emojis["IO"] = "\u{1F1EE}\u{1F1F4}"
    emojis["IQ"] = "\u{1F1EE}\u{1F1F6}"
    emojis["IR"] = "\u{1F1EE}\u{1F1F7}"
    emojis["IS"] = "\u{1F1EE}\u{1F1F8}"
    emojis["IT"] = "\u{1F1EE}\u{1F1F9}"
    emojis["JE"] = "\u{1F1EF}\u{1F1EA}"
    emojis["JM"] = "\u{1F1EF}\u{1F1F2}"
    emojis["JO"] = "\u{1F1EF}\u{1F1F4}"
    emojis["JP"] = "\u{1F1EF}\u{1F1F5}"
    emojis["KE"] = "\u{1F1F0}\u{1F1EA}"
    emojis["KG"] = "\u{1F1F0}\u{1F1EC}"
    emojis["KH"] = "\u{1F1F0}\u{1F1ED}"
    emojis["KI"] = "\u{1F1F0}\u{1F1EE}"
    emojis["KM"] = "\u{1F1F0}\u{1F1F2}"
    emojis["KN"] = "\u{1F1F0}\u{1F1F3}"
    emojis["KP"] = "\u{1F1F0}\u{1F1F5}"
    emojis["KR"] = "\u{1F1F0}\u{1F1F7}"
    emojis["KW"] = "\u{1F1F0}\u{1F1FC}"
    emojis["KY"] = "\u{1F1F0}\u{1F1FE}"
    emojis["KZ"] = "\u{1F1F0}\u{1F1FF}"
    emojis["LA"] = "\u{1F1F1}\u{1F1E6}"
    emojis["LB"] = "\u{1F1F1}\u{1F1E7}"
    emojis["LC"] = "\u{1F1F1}\u{1F1E8}"
    emojis["LI"] = "\u{1F1F1}\u{1F1EE}"
    emojis["LK"] = "\u{1F1F1}\u{1F1F0}"
    emojis["LR"] = "\u{1F1F1}\u{1F1F7}"
    emojis["LS"] = "\u{1F1F1}\u{1F1F8}"
    emojis["LT"] = "\u{1F1F1}\u{1F1F9}"
    emojis["LU"] = "\u{1F1F1}\u{1F1FA}"
    emojis["LV"] = "\u{1F1F1}\u{1F1FB}"
    emojis["LY"] = "\u{1F1F1}\u{1F1FE}"
    emojis["MA"] = "\u{1F1F2}\u{1F1E6}"
    emojis["MC"] = "\u{1F1F2}\u{1F1E8}"
    emojis["MD"] = "\u{1F1F2}\u{1F1E9}"
    emojis["ME"] = "\u{1F1F2}\u{1F1EA}"
    emojis["MF"] = "\u{1F1F2}\u{1F1EB}"
    emojis["MG"] = "\u{1F1F2}\u{1F1EC}"
    emojis["MH"] = "\u{1F1F2}\u{1F1ED}"
    emojis["MK"] = "\u{1F1F2}\u{1F1F0}"
    emojis["ML"] = "\u{1F1F2}\u{1F1F1}"
    emojis["MM"] = "\u{1F1F2}\u{1F1F2}"
    emojis["MN"] = "\u{1F1F2}\u{1F1F3}"
    emojis["MO"] = "\u{1F1F2}\u{1F1F4}"
    emojis["MP"] = "\u{1F1F2}\u{1F1F5}"
    emojis["MQ"] = "\u{1F1F2}\u{1F1F6}"
    emojis["MR"] = "\u{1F1F2}\u{1F1F7}"
    emojis["MS"] = "\u{1F1F2}\u{1F1F8}"
    emojis["MT"] = "\u{1F1F2}\u{1F1F9}"
    emojis["MU"] = "\u{1F1F2}\u{1F1FA}"
    emojis["MV"] = "\u{1F1F2}\u{1F1FB}"
    emojis["MW"] = "\u{1F1F2}\u{1F1FC}"
    emojis["MX"] = "\u{1F1F2}\u{1F1FD}"
    emojis["MY"] = "\u{1F1F2}\u{1F1FE}"
    emojis["MZ"] = "\u{1F1F2}\u{1F1FF}"
    emojis["NA"] = "\u{1F1F3}\u{1F1E6}"
    emojis["NC"] = "\u{1F1F3}\u{1F1E8}"
    emojis["NE"] = "\u{1F1F3}\u{1F1EA}"
    emojis["NF"] = "\u{1F1F3}\u{1F1EB}"
    emojis["NG"] = "\u{1F1F3}\u{1F1EC}"
    emojis["NI"] = "\u{1F1F3}\u{1F1EE}"
    emojis["NL"] = "\u{1F1F3}\u{1F1F1}"
    emojis["NO"] = "\u{1F1F3}\u{1F1F4}"
    emojis["NP"] = "\u{1F1F3}\u{1F1F5}"
    emojis["NR"] = "\u{1F1F3}\u{1F1F7}"
    emojis["NU"] = "\u{1F1F3}\u{1F1FA}"
    emojis["NZ"] = "\u{1F1F3}\u{1F1FF}"
    emojis["OM"] = "\u{1F1F4}\u{1F1F2}"
    emojis["PA"] = "\u{1F1F5}\u{1F1E6}"
    emojis["PE"] = "\u{1F1F5}\u{1F1EA}"
    emojis["PF"] = "\u{1F1F5}\u{1F1EB}"
    emojis["PG"] = "\u{1F1F5}\u{1F1EC}"
    emojis["PH"] = "\u{1F1F5}\u{1F1ED}"
    emojis["PK"] = "\u{1F1F5}\u{1F1F0}"
    emojis["PL"] = "\u{1F1F5}\u{1F1F1}"
    emojis["PM"] = "\u{1F1F5}\u{1F1F2}"
    emojis["PN"] = "\u{1F1F5}\u{1F1F3}"
    emojis["PR"] = "\u{1F1F5}\u{1F1F7}"
    emojis["PS"] = "\u{1F1F5}\u{1F1F8}"
    emojis["PT"] = "\u{1F1F5}\u{1F1F9}"
    emojis["PW"] = "\u{1F1F5}\u{1F1FC}"
    emojis["PY"] = "\u{1F1F5}\u{1F1FE}"
    emojis["QA"] = "\u{1F1F6}\u{1F1E6}"
    emojis["RE"] = "\u{1F1F7}\u{1F1EA}"
    emojis["RO"] = "\u{1F1F7}\u{1F1F4}"
    emojis["RS"] = "\u{1F1F7}\u{1F1F8}"
    emojis["RU"] = "\u{1F1F7}\u{1F1FA}"
    emojis["RW"] = "\u{1F1F7}\u{1F1FC}"
    emojis["SA"] = "\u{1F1F8}\u{1F1E6}"
    emojis["SB"] = "\u{1F1F8}\u{1F1E7}"
    emojis["SC"] = "\u{1F1F8}\u{1F1E8}"
    emojis["SD"] = "\u{1F1F8}\u{1F1E9}"
    emojis["SE"] = "\u{1F1F8}\u{1F1EA}"
    emojis["SG"] = "\u{1F1F8}\u{1F1EC}"
    emojis["SH"] = "\u{1F1F8}\u{1F1ED}"
    emojis["SI"] = "\u{1F1F8}\u{1F1EE}"
    emojis["SJ"] = "\u{1F1F8}\u{1F1EF}"
    emojis["SK"] = "\u{1F1F8}\u{1F1F0}"
    emojis["SL"] = "\u{1F1F8}\u{1F1F1}"
    emojis["SM"] = "\u{1F1F8}\u{1F1F2}"
    emojis["SN"] = "\u{1F1F8}\u{1F1F3}"
    emojis["SO"] = "\u{1F1F8}\u{1F1F4}"
    emojis["SR"] = "\u{1F1F8}\u{1F1F7}"
    emojis["SS"] = "\u{1F1F8}\u{1F1F8}"
    emojis["ST"] = "\u{1F1F8}\u{1F1F9}"
    emojis["SV"] = "\u{1F1F8}\u{1F1FB}"
    emojis["SX"] = "\u{1F1F8}\u{1F1FD}"
    emojis["SY"] = "\u{1F1F8}\u{1F1FE}"
    emojis["SZ"] = "\u{1F1F8}\u{1F1FF}"
    emojis["TC"] = "\u{1F1F9}\u{1F1E8}"
    emojis["TD"] = "\u{1F1F9}\u{1F1E9}"
    emojis["TF"] = "\u{1F1F9}\u{1F1EB}"
    emojis["TG"] = "\u{1F1F9}\u{1F1EC}"
    emojis["TH"] = "\u{1F1F9}\u{1F1ED}"
    emojis["TJ"] = "\u{1F1F9}\u{1F1EF}"
    emojis["TK"] = "\u{1F1F9}\u{1F1F0}"
    emojis["TL"] = "\u{1F1F9}\u{1F1F1}"
    emojis["TM"] = "\u{1F1F9}\u{1F1F2}"
    emojis["TN"] = "\u{1F1F9}\u{1F1F3}"
    emojis["TO"] = "\u{1F1F9}\u{1F1F4}"
    emojis["TR"] = "\u{1F1F9}\u{1F1F7}"
    emojis["TT"] = "\u{1F1F9}\u{1F1F9}"
    emojis["TV"] = "\u{1F1F9}\u{1F1FB}"
    emojis["TW"] = "\u{1F1F9}\u{1F1FC}"
    emojis["TZ"] = "\u{1F1F9}\u{1F1FF}"
    emojis["UA"] = "\u{1F1FA}\u{1F1E6}"
    emojis["UG"] = "\u{1F1FA}\u{1F1EC}"
    emojis["UM"] = "\u{1F1FA}\u{1F1F2}"
    emojis["US"] = "\u{1F1FA}\u{1F1F8}"
    emojis["UY"] = "\u{1F1FA}\u{1F1FE}"
    emojis["UZ"] = "\u{1F1FA}\u{1F1FF}"
    emojis["VA"] = "\u{1F1FB}\u{1F1E6}"
    emojis["VC"] = "\u{1F1FB}\u{1F1E8}"
    emojis["VE"] = "\u{1F1FB}\u{1F1EA}"
    emojis["VG"] = "\u{1F1FB}\u{1F1EC}"
    emojis["VI"] = "\u{1F1FB}\u{1F1EE}"
    emojis["VN"] = "\u{1F1FB}\u{1F1F3}"
    emojis["VU"] = "\u{1F1FB}\u{1F1FA}"
    emojis["WF"] = "\u{1F1FC}\u{1F1EB}"
    emojis["WS"] = "\u{1F1FC}\u{1F1F8}"
    emojis["XK"] = "\u{1F1FD}\u{1F1F0}"
    emojis["YE"] = "\u{1F1FE}\u{1F1EA}"
    emojis["YT"] = "\u{1F1FE}\u{1F1F9}"
    emojis["ZA"] = "\u{1F1FF}\u{1F1E6}"
    emojis["ZM"] = "\u{1F1FF}\u{1F1F2}"
    emojis["ZW"] = "\u{1F1FF}\u{1F1FC}"
    return emojis[self.code]
  end


  def self.search(query)
    query = query.strip
    country = Country.where("code like '%#{query}%'") if query.length <= 3
    country = Country.where("name like '%#{query}%'") if country.map{|c|}.count == 0
    return country

  end

end
