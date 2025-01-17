import 'calculation_parameters.dart';
import 'prayer_adjustments.dart';

/// Standard calculation methods for calculating prayer times
enum CalculationMethod {
  /// Muslim World League
  /// Uses Fajr angle of 18 and an Isha angle of 17
  muslim_world_league,

  /// Egyptian General Authority of Survey
  /// Uses Fajr angle of 19.5 and an Isha angle of 17.5
  egyptian,

  /// University of Islamic Sciences, Karachi
  /// Uses Fajr angle of 18 and an Isha angle of 18
  karachi,

  /// Umm al-Qura University, Makkah
  /// Uses a Fajr angle of 18.5 and an Isha angle of 90. Note: You should add a +30 minute custom
  /// adjustment of Isha during Ramadan.
  umm_al_qura,

  /// The Gulf Region
  /// Uses Fajr and Isha angles of 18.2 degrees.
  dubai,

  /// Moon Sighting Committee
  /// Uses a Fajr angle of 18 and an Isha angle of 18. Also uses seasonal adjustment values.
  moon_sighting_committee,

  /// Referred to as the ISNA method
  /// This method is included for completeness, but is not recommended.
  /// Uses a Fajr angle of 15 and an Isha angle of 15.
  north_america,

  /// Kuwait
  /// Uses a Fajr angle of 18 and an Isha angle of 17.5
  kuwait,

  /// Qatar
  /// Modified version of Umm al-Qura that uses a Fajr angle of 18.
  qatar,

  /// Singapore
  /// Uses a Fajr angle of 20 and an Isha angle of 18
  singapore,

  /// Dianet
  turkey,

  /// Institute of Geophysics, University of Tehran. Early Isha time with an angle of 14°. Slightly later Fajr time with an angle of 17.7°.
  /// Calculates Maghrib based on the sun reaching an angle of 4.5° below the horizon.
  tehran,

  /// Azerbaijan
  /// Uses parameters from Caucasus Muslims Board
  azerbaijan,

  /// France
  /// Uses Fajr angle of 18 and an Isha angle of 17, similar to Muslim World League
  france,

  /// Bulgaria
  bulgaria,

  /// bengali
  bengali,

  /// Germany
  germany,

  /// malasia
  malasia,

  // endonesia
  indonesia,

  //Unated Kingdom
  united_kingdom,

  /// ispanya
  spain,

  /// hindistan
  hindistan,

  /// porteguese
  porteguese,

  /// russia
  russia,

  ///netherlands
  netherlands,

  ///canada
  canada,

  ///united_states
  united_states,

  /// The default value for [CalculationParameters.method] when initializing a
  /// [CalculationParameters] object. Sets a Fajr angle of 0 and an Isha angle of 0.
  other
}

extension CalculationMethodExtensions on CalculationMethod {
  /// Return the CalculationParameters for the given method
  /// return CalculationParameters for the given Calculation method
  CalculationParameters getParameters() {
    switch (this) {
      case CalculationMethod.muslim_world_league:
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 0, sunrise: 0, dhuhr: 1, asr: 0, maghrib: 0, isha: 0));
        }
      case CalculationMethod.egyptian:
        {
          return CalculationParameters(
                  fajrAngle: 19.5, ishaAngle: 17.5, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 0, sunrise: 0, dhuhr: 1, asr: 0, maghrib: 0, isha: 0));
        }
      case CalculationMethod.karachi:
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 0, sunrise: 0, dhuhr: 1, asr: 0, maghrib: 0, isha: 0));
        }
      case CalculationMethod.umm_al_qura:
        {
          return CalculationParameters(
              fajrAngle: 18.5, ishaInterval: 90, method: this);
        }
      case CalculationMethod.dubai: // ! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.2, ishaAngle: 18.2, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -2, sunrise: 0, dhuhr: 0, asr: 1, maghrib: 1, isha: 9));
        }
      case CalculationMethod.moon_sighting_committee:
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 0, sunrise: 0, dhuhr: 5, asr: 0, maghrib: 3, isha: 0));
        }
      case CalculationMethod.north_america:
        {
          return CalculationParameters(
                  fajrAngle: 15.0, ishaAngle: 15.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 0, sunrise: 0, dhuhr: 1, asr: 0, maghrib: 0, isha: 0));
        }
      case CalculationMethod.kuwait:
        {
          return CalculationParameters(
              fajrAngle: 18.0, ishaAngle: 17.5, method: this);
        }
      case CalculationMethod.qatar:
        {
          return CalculationParameters(
              fajrAngle: 18.0, ishaInterval: 90, method: this);
        }
      case CalculationMethod.singapore:
        {
          return CalculationParameters(
                  fajrAngle: 20.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 0, sunrise: 0, dhuhr: 1, asr: 0, maghrib: 0, isha: 0));
        }
      case CalculationMethod.turkey: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -7,
                  sunrise: 0,
                  dhuhr: -1,
                  asr: 0,
                  maghrib: 0,
                  isha: 2));
        }
      case CalculationMethod.tehran: //! yapıldı
        {
          return CalculationParameters(
            fajrAngle: 17.7,
            ishaAngle: 14,
            maghribAngle: 4.5,
            method: this,
          ).withMethodAdjustments(PrayerAdjustments(
              fajr: -1,
              sunrise: -7,
              dhuhr: 5,
              asr: -37,
              maghrib: -13,
              isha: 14));
        }
      case CalculationMethod.azerbaijan: //! yapıldı
        {
          return CalculationParameters(
            fajrAngle: 18.0,
            ishaAngle: 17.0,
            method: this,
          ).withMethodAdjustments(PrayerAdjustments(
              fajr: 0, sunrise: -7, dhuhr: 5, asr: -35, maghrib: 6, isha: 0));
        }
      case CalculationMethod.france: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 33,
                  sunrise: -9,
                  dhuhr: 1,
                  asr: 11,
                  maghrib: 10,
                  isha: -26));
        }
      case CalculationMethod.bulgaria: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -9,
                  sunrise: -9,
                  dhuhr: -9,
                  asr: -9,
                  maghrib: -9,
                  isha: -9));
        }
      case CalculationMethod.bengali: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -1,
                  sunrise: 0,
                  dhuhr: 0,
                  asr: 0,
                  maghrib: -1,
                  isha: 0));
        }
      case CalculationMethod.germany: //! tamamlandı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 16.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -0,
                  sunrise: -7,
                  dhuhr: 5,
                  asr: -29,
                  maghrib: 6,
                  isha: -1));
        }
      case CalculationMethod.malasia: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 20.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 11,
                  sunrise: 0,
                  dhuhr: 1,
                  asr: -54,
                  maghrib: 1,
                  isha: 1));
        }
      case CalculationMethod.indonesia: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 20.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 1, sunrise: 0, dhuhr: 0, asr: 0, maghrib: 1, isha: 1));
        }
      case CalculationMethod.united_kingdom: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 12.0, ishaAngle: 12.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -40,
                  sunrise: -6,
                  dhuhr: 5,
                  asr: -30,
                  maghrib: 6,
                  isha: 26));
        }
      case CalculationMethod.spain: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -8,
                  sunrise: 0,
                  dhuhr: 0,
                  asr: 0,
                  maghrib: -0,
                  isha: 1));
        }

      case CalculationMethod.hindistan: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -21,
                  sunrise: -24,
                  dhuhr: -13,
                  asr: -1,
                  maghrib: -1,
                  isha: -5));
        }
      case CalculationMethod.porteguese: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -0,
                  sunrise: -0,
                  dhuhr: 0,
                  asr: -0,
                  maghrib: 0,
                  isha: -0));
        }
      case CalculationMethod.russia: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 17.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -0,
                  sunrise: -7,
                  dhuhr: 5,
                  asr: -26,
                  maghrib: 6,
                  isha: -8));
        }
      case CalculationMethod.netherlands: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: 1,
                  sunrise: -7,
                  dhuhr: 5,
                  asr: -30,
                  maghrib: 6,
                  isha: -15));
        }
      case CalculationMethod.canada: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -9,
                  sunrise: 0,
                  dhuhr: 0,
                  asr: 0,
                  maghrib: 0,
                  isha: -2));
        }
      case CalculationMethod.united_states: //! yapıldı
        {
          return CalculationParameters(
                  fajrAngle: 18.0, ishaAngle: 18.0, method: this)
              .withMethodAdjustments(PrayerAdjustments(
                  fajr: -8,
                  sunrise: 0,
                  dhuhr: 0,
                  asr: 0,
                  maghrib: 0,
                  isha: -2));
        }
      case CalculationMethod.other:
        {
          return CalculationParameters(
              fajrAngle: 0.0, ishaAngle: 0.0, method: this);
        }
      default:
        {
          throw FormatException('Invalid CalculationMethod');
        }
    }
  }
}
