class RequestDeviceChangeModel {
  final String societyId;
  final String user_id;
  final String mac_address_change_reason;
  final String user_mac_address;
  final String mac_address_device;
  final String mac_address_phone_modal;
  final String language_id;

  RequestDeviceChangeModel(
    this.user_id,
    this.mac_address_change_reason,
    this.user_mac_address,
    this.mac_address_device,
    this.mac_address_phone_modal,
    this.language_id, {
    required this.societyId,
  });

  Map<String, dynamic> toMap() => {
    'changeMacRequest': 'changeMacRequest',
    'society_id': societyId,
    'user_id': user_id,
    'mac_address_change_reason': mac_address_change_reason,
    'user_mac_address': user_mac_address,
    'mac_address_device': mac_address_device,
    'mac_address_phone_modal': mac_address_phone_modal,
    'language_id': language_id,
  };
}
