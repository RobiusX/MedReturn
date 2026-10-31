enum DonationStatus { delivered, inTransit, pending }

/// Domain model representing a donation record displayed on the Dashboard.
class DonationRecord {
  const DonationRecord({
    required this.id,
    required this.medicineName,
    required this.unitCount,
    required this.status,
  });

  final String id;
  final String medicineName;
  final int unitCount;
  final DonationStatus status;
}
